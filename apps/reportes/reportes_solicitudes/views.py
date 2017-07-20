#encoding:utf-8
from django.views.generic import CreateView, TemplateView, DetailView, ListView, View
from django.core.urlresolvers import reverse_lazy
from django.shortcuts import render, render_to_response, get_object_or_404
from django.core import serializers
from apps.topologia.estados.models import Estado
from django.db.models import Count
import json
import sys
from django.http import HttpResponse
from django.template import RequestContext
from apps.reportes.reportes_solicitudes.class_pdf import ReporteConstruct
from django.db import connection, transaction
import time
from django.db import connection, transaction
from apps.reportes.reportes_solicitudes import procesos
from apps.configuracion.instituciones.models import Institucion
from apps.configuracion.grupo_etareo.models import Grupo_Etareo
from apps.configuracion.tipo_educacion.models import TipoEducacion
from apps.configuracion.ocupacion.models import Ocupaciones
from apps.configuracion.sector_laboral.models import SectorLaboral
from apps.configuracion.dependencias.models import Dependencia
from apps.configuracion.organizacion_social.models import Organizaciones
from apps.configuracion.motivo.models import Motivos
from django.conf import settings  # Ruta de settings
from apps.reportes.reportes_solicitudes.formato_reportes import reporte_solicitudes_general
from apps.reportes.reportes_solicitudes.formato_reportes import reporte_ficha_personal
from apps.registro.solicitud.models import Registros


class ReporteSolicitudes(TemplateView):

    template_name = 'reportes/reporte_solicitudes.html'

    def get_context_data(self, **kwargs):
        context = super(ReporteSolicitudes, self).get_context_data(**kwargs)

        list_estados = Estado.objects.all()
        list_grupos = Grupo_Etareo.objects.all()
        institucion = Institucion.objects.all()
        
        nivel = TipoEducacion.objects.all()
        ocupacion = Ocupaciones.objects.all()
        sector = SectorLaboral.objects.all()
        organizacion = Organizaciones.objects.all()
        
        personas = Registros.objects.all().values('cedula','nombre', 'apellido').annotate(dcount=Count('cedula')).order_by('-cedula')


        #  Pestaña 2
        motivos = Motivos.objects.all()
        departamentos = Dependencia.objects.all()

        context['listado_niveles'] = nivel
        context['listado_ocupaciones'] = ocupacion
        context['listado_sectores'] = sector
        context['listado_organizaciones'] = organizacion

        #  Pestaña 1
        context['listado_departamentos'] = departamentos
        context['listado_motivos'] = motivos
        context['list_estados'] = list_estados
        context['list_grupos'] = list_grupos
        context['institucion'] = institucion
        context['listado_personas'] = personas
        return context

    def post(self, request, *args, **kwargs):

        response_data = []
        context = super(ReporteSolicitudes, self).get_context_data(**kwargs)
        bandera = request.POST.get('bandera')
        tipo = request.POST.get('tipo')
        estado = request.POST.get('estado')
        desde = request.POST.get('from_date')
        hasta = request.POST.get('to_date')
        id_inst = request.POST.get('id_inst')

        cursor = connection.cursor()
        if tipo == '1':
            sql_sop = "  SELECT sexo, COUNT(sexo) total FROM solicitud_registros "
            sql_sop += " WHERE institucion_id=%s and fecha_ent::date between %s and %s "
            sql_sop += " GROUP BY sexo"
            cursor.execute(sql_sop,[id_inst,desde,hasta])
        elif tipo == '2':
            sql_sop = "  SELECT CONCAT (g.descripcion,' (',g.desde,'-',g.hasta,' Años)') descripcion, "
            sql_sop += " (SELECT COUNT (edad) from solicitud_registros  "
            sql_sop += " WHERE institucion_id=%s and fecha_ent::date between %s and %s "
            sql_sop += " AND edad BETWEEN g.desde::integer AND g.hasta::integer) total"
            sql_sop += " FROM grupo_etareo_grupo_etareo AS g ORDER BY total DESC"
            cursor.execute(sql_sop,[id_inst,desde,hasta])
        elif tipo == '3':
            sql_sop = "  SELECT motivo, "
            sql_sop += " (SELECT COUNT (motivo_id) from solicitud_registros   "
            sql_sop += " WHERE institucion_id=%s and fecha_ent::date between %s and %s "
            sql_sop += " and motivo_id=m.id) total"
            sql_sop += " FROM motivo_motivos AS m ORDER BY total DESC"
            cursor.execute(sql_sop,[id_inst,desde,hasta])
        elif tipo == '4':
            sql_sop = "  SELECT municipio, "
            sql_sop += " (SELECT COUNT (municipio) from solicitud_registros   "
            sql_sop += " WHERE institucion_id=%s and fecha_ent::date between %s and %s "
            sql_sop += " and municipio=m.id) total"
            sql_sop += " FROM municipios_municipio AS m WHERE estado_id=%s ORDER BY total DESC"
            cursor.execute(sql_sop,[id_inst,desde,hasta,estado])
        elif tipo == '5':
            sql_sop = "  SELECT ocupacion, "
            sql_sop += " (SELECT COUNT (ocupacion_id) from solicitud_registros   "
            sql_sop += " WHERE institucion_id=%s and fecha_ent::date between %s and %s "
            sql_sop += " and ocupacion_id=o.id) total"
            sql_sop += " FROM ocupacion_ocupaciones AS o ORDER BY total DESC"
            cursor.execute(sql_sop,[id_inst,desde,hasta])
        elif tipo == '6':
            sql_sop = "  SELECT tipo, "
            sql_sop += " (SELECT COUNT (tipo_edu_id) from solicitud_registros   "
            sql_sop += " WHERE institucion_id=%s and fecha_ent::date between %s and %s "
            sql_sop += " and tipo_edu_id=t.id) total"
            sql_sop += " FROM tipo_educacion_tipoeducacion AS t ORDER BY total DESC"
            cursor.execute(sql_sop,[id_inst,desde,hasta])
        elif tipo == '7':
            sql_sop = "  SELECT organizacion, "
            sql_sop += " (SELECT COUNT (organizacion_id) from solicitud_registros   "
            sql_sop += " WHERE institucion_id=%s and fecha_ent::date between %s and %s "
            sql_sop += " and organizacion_id=os.id) total"
            sql_sop += " FROM organizacion_social_organizaciones AS os ORDER BY total DESC"
            cursor.execute(sql_sop,[id_inst,desde,hasta])
        else:
            sql_sop = "  SELECT sector, "
            sql_sop += " (SELECT COUNT (sector_lab_id) from solicitud_registros   "
            sql_sop += " WHERE institucion_id=%s and fecha_ent::date between %s and %s "
            sql_sop += " and sector_lab_id=sl.id) total"
            sql_sop += " FROM sector_laboral_sectorlaboral AS sl ORDER BY total DESC"
            cursor.execute(sql_sop,[id_inst,desde,hasta])

        queryset = dictfetchall(cursor)

        tam = len(queryset)
        response_data = []

        for i in queryset:
            if int(i['total']) > 0:
                response_data.append(i)
        data = json.dumps(response_data)

        return HttpResponse(data, content_type='application/json')


class Reporte(View):

    def get_context_data(self, **kwargs):
        context = {}
        return context

    def get(self, request, *args, **kwargs):
        # exitpoll = self.request.GET.get('exitpoll')
        tipo = self.request.GET.get('tipo')
        id_inst = self.request.GET.get('id_inst')
        estado = self.request.GET.get('estado')
        desde = self.request.GET.get('desde')
        hasta = self.request.GET.get('hasta')
        sexo = self.request.GET.get('sexo')
        grupo = self.request.GET.get('grupo')
        motivo = self.request.GET.get('motivo')
        municipio = self.request.GET.get('municipio')
        ocupacion = self.request.GET.get('ocupacion')
        tipo_edu = self.request.GET.get('tipo_edu')
        organizacion = self.request.GET.get('organizacion')
        sector = self.request.GET.get('sector')
        dependencia = self.request.GET.get('dependencia')
        reload(sys)
        sys.setdefaultencoding("utf-8")

        cursor = connection.cursor()
        sql_pdf = "SELECT s.id"
        sql_pdf += " FROM solicitud_registros s"
        if tipo == '1':
            sql_pdf += " WHERE institucion_id=%s and fecha_ent::date between %s and %s"
            cursor.execute(sql_pdf,[id_inst,desde,hasta])
        elif tipo == '2':
            sql_grupo = "SELECT desde, hasta FROM grupo_etareo_grupo_etareo WHERE id=%s "
            cursor.execute(sql_grupo,[grupo])
            row = dictfetchall(cursor)
            desde_e = row[0]['desde']
            hasta_e = row[0]['hasta']
            sql_pdf += " WHERE s.institucion_id=%s and s.edad between %s and %s and s.fecha_ent::date between %s and %s"
            cursor.execute(sql_pdf,[id_inst,desde_e,hasta_e,desde,hasta])
        elif tipo == '3':
            sql_pdf += " WHERE s.institucion_id=%s and s.motivo_id=%s and s.fecha_ent::date between %s and %s "
            cursor.execute(sql_pdf,[id_inst,motivo,desde,hasta])
        elif tipo == '4':
            sql_pdf += " WHERE s.institucion_id=%s and s.estado_id=%s and s.municipio=%s and s.fecha_ent::date between %s and %s "
            cursor.execute(sql_pdf,[id_inst,estado,municipio,desde,hasta])
        elif tipo == '5':
            sql_pdf += " WHERE s.institucion_id=%s and s.ocupacion_id=%s and s.fecha_ent::date between %s and %s "
            cursor.execute(sql_pdf,[id_inst,ocupacion,desde,hasta])
        elif tipo == '6':
            sql_pdf += " WHERE s.institucion_id=%s and s.tipo_edu_id=%s and s.fecha_ent::date between %s and %s "
            cursor.execute(sql_pdf,[id_inst,tipo_edu,desde,hasta])
        elif tipo == '7':
            sql_pdf += " WHERE s.institucion_id=%s and s.organizacion_id=%s and s.fecha_ent::date between %s and %s "
            cursor.execute(sql_pdf,[id_inst,organizacion,desde,hasta])
        elif tipo == '8':
            sql_pdf += " WHERE s.institucion_id=%s and s.sector_lab_id=%s and s.fecha_ent::date between %s and %s "
            cursor.execute(sql_pdf,[id_inst,sector,desde,hasta])
        elif tipo == '9':
            sql_pdf += " WHERE s.institucion_id=%s and s.departamento_id=%s and s.fecha_ent::date between %s and %s "
            cursor.execute(sql_pdf,[id_inst,dependencia,desde,hasta])
        elif tipo == '10':
            sql_pdf += " WHERE institucion_id=%s and fecha_ent::date between %s and %s"
            cursor.execute(sql_pdf,[id_inst,desde,hasta])
        elif tipo == '11':
            sql_pdf += " WHERE institucion_id=%s and fecha_ent::date between %s and %s"
            cursor.execute(sql_pdf,[id_inst,desde,hasta])
        elif tipo == '12':
            sql_pdf += " WHERE institucion_id=%s and fecha_ent::date between %s and %s"
            cursor.execute(sql_pdf,[id_inst,desde,hasta])
        elif tipo == '13':
            sql_pdf += " WHERE institucion_id=%s and fecha_ent::date between %s and %s"
            cursor.execute(sql_pdf,[id_inst,desde,hasta])
        elif tipo == '14':
            sql_pdf += " WHERE institucion_id=%s and fecha_ent::date between %s and %s"
            cursor.execute(sql_pdf,[id_inst,desde,hasta])
        row = dictfetchall(cursor)

        if len(row) == 0:
            response = "<body>"
            response += "<link rel='stylesheet' type='text/css' href='/static/css/bootstrap.css'>"
            response += "<script src='/static/js/bootstrap.min.js'></script>"
            response += "<img src='/static/img/tope.jpg' style='width: 100%'/>"
            response += "<img src='/static/img/no_disponible.png' style='width:80%;margin-left:10%'/>"
            response += "<button title='Cerrar ventana' class='btn btn-danger' style='font-size:24px; width:20%; height: 10%; font-weight: bold; text-align: center;margin-left:40%' onclick=window.close()>Cerrar</button>"
            response += "<body>"
            return HttpResponse(response)
        else:
            nombre, archivo = reporte_solicitudes_general.reporte_solicitudes_general(id_inst,tipo,estado,desde,
                                                                                      hasta,sexo,grupo,motivo,municipio,
                                                                                      ocupacion,tipo_edu,organizacion,sector,dependencia)
            response = HttpResponse(archivo.read(), content_type='application/pdf')
            response['Content-Disposition'] = 'inline; filename="'+str(nombre)

            return response
        
class Ficha(View):

    def get_context_data(self, **kwargs):
        context = {}
        return context

    def get(self, request, *args, **kwargs):
        reload(sys)
        sys.setdefaultencoding("utf-8")
        cedula = self.request.GET.get('cedula')
        desde = request.GET.get('desde')
        hasta = request.GET.get('hasta')
        id_inst = request.GET.get('id_inst')
        tipo = request.GET.get('tipo')

        if tipo == '1':
            cursor = connection.cursor()
            sql_pdf = "SELECT s.id"
            sql_pdf += " FROM solicitud_registros s"
            sql_pdf += " WHERE cedula=%s AND institucion_id=%s and fecha_ent::date between %s and %s"
            cursor.execute(sql_pdf,[cedula,id_inst,desde,hasta])
            row = dictfetchall(cursor)
            if len(row) == 0:
                response = "<body>"
                response += "<link rel='stylesheet' type='text/css' href='/static/css/bootstrap.css'>"
                response += "<script src='/static/js/bootstrap.min.js'></script>"
                response += "<img src='/static/img/tope.jpg' style='width: 100%'/>"
                response += "<img src='/static/img/no_disponible.png' style='width:80%;margin-left:10%'/>"
                response += "<button title='Cerrar ventana' class='btn btn-danger' style='font-size:24px; width:20%; height: 10%; font-weight: bold; text-align: center;margin-left:40%' onclick=window.close()>Cerrar</button>"
                response += "<body>"
                return HttpResponse(response)
            else:
                nombre, archivo = reporte_ficha_personal.reporte_ficha_personal(cedula, desde, hasta, id_inst,tipo)
                response = HttpResponse(archivo.read(), content_type='application/pdf')
                response['Content-Disposition'] = 'inline; filename="'+str(nombre)
        else:
            nombre, archivo = reporte_ficha_personal.reporte_ficha_personal(cedula, desde, hasta, id_inst,tipo)
            response = HttpResponse(archivo.read(), content_type='application/pdf')
            response['Content-Disposition'] = 'inline; filename="'+str(nombre)

        return response


def dictfetchall(cursor):
    "Returns all rows from a cursor as a dict"
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]


