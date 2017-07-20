# -*- coding: utf-8 -*-
from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from apps.topologia.estados.models import Estado
from apps.topologia.municipios.models import Municipio
from apps.topologia.parroquias.models import Parroquia
from apps.configuracion.instituciones.models import Institucion
from .models import Registros
from django.http import HttpResponse, HttpResponseRedirect
import time
import datetime
from django.contrib.auth.models import User
from apps.configuracion.tipo_educacion.models import TipoEducacion
from apps.configuracion.ocupacion.models import Ocupaciones
from apps.configuracion.sector_laboral.models import SectorLaboral
from apps.configuracion.instituciones.models import Institucion
from apps.configuracion.dependencias.models import Dependencia
from apps.configuracion.organizacion_social.models import Organizaciones
from apps.configuracion.motivo.models import Motivos
from apps.configuracion.trabajadores.models import Trabajadores
from django.db import connection
import re
import json
from django.core import serializers


class RegistrarSolicitud(CreateView):
    template_name = 'registro/solicitud/registro.html'
    model = Registros
    success_url = reverse_lazy("lista") 

    def get_context_data(self, **kwargs):
        context = super(RegistrarSolicitud, self).get_context_data(**kwargs)

        #  Pestaña 1
        codigo = Registros.objects.order_by('-id').values('codigo')[:1] # ordenar de forma descendente y traer solo 1

        if codigo.count() > 0:

            codigo = re.findall(r'\d+', codigo[0]['codigo']) # extraer solo numeros
            codigo = int(codigo[0]) # convertir a entero (eliminar los 0 a la izquierda)
            codigo = "CV"+str(codigo+1).zfill(4) # sumo 1 y se rellena con 4 "0" a la izquierda
        else:
            codigo = 'CV0001'

        usuario_id = self.request.user.id
        # print usuario_id
        id_institucion = Trabajadores.objects.filter(trabajador_id=usuario_id).values('institucion')[:1]
        # print id_institucion

        estado = Estado.objects.all()
        fmt = '%d/%m/%Y %I:%M:%S '
        dat = datetime.datetime.now()
        fecha_ent = dat.strftime(fmt)
        usuario_id = self.request.user.id
        usuario = User.objects.get(id=usuario_id).username
        nivel = TipoEducacion.objects.all()
        ocupacion = Ocupaciones.objects.all()
        sector = SectorLaboral.objects.all()
        organizacion = Organizaciones.objects.all()

        #  Pestaña 2
        motivos = Motivos.objects.all()
        institucion = Institucion.objects.filter(id=id_institucion)
        departamentos = Dependencia.objects.all()

        #  Pestaña 1
        context['listado_estado'] = estado
        context['codigo'] = codigo
        context['fecha_ent'] = fecha_ent
        context['usuario'] = usuario
        context['listado_niveles'] = nivel
        context['listado_ocupaciones'] = ocupacion
        context['listado_sectores'] = sector
        context['listado_organizaciones'] = organizacion

        #  Pestaña 1
        context['listado_departamentos'] = departamentos
        context['listado_motivos'] = motivos
        context['lista_institucion'] = institucion

        return context

    def post(self, request, *args, **kwargs):

        bandera = request.POST.get('bandera')
        codigo = request.POST.get('codigo')

        form_class = self.get_form_class()
        form = self.get_form(form_class)
        print form
        if form.is_valid():
            form.save()
            return HttpResponse('/menu/registros/solicitud/listar/')


class ListarSolicitud(ListView):
    template_name = 'registro/solicitud/listado.html'
    model = Registros
    context_object_name = "listado"


class ActualizarSolicitud(UpdateView):
    template_name = 'registro/solicitud/actualizar.html'
    model = Registros
    success_url = reverse_lazy("lista")
    context_object_name = "registro_act"

    def get_context_data(self, **kwargs):
        context = super(ActualizarSolicitud, self).get_context_data(**kwargs)

        institucion = Institucion.objects.all()
        tipo = TipoEducacion.objects.all()
        estado = Estado.objects.all()
        list_mun = Municipio.objects.all()
        list_par = Parroquia.objects.all()
        # usuario_id = self.request.user.id
        # usuario = User.objects.get(id=usuario_id).username
        departamentos = Dependencia.objects.all()
        motivos = Motivos.objects.all()
        ocupacion = Ocupaciones.objects.all()
        organizacion = Organizaciones.objects.all()
        sector = SectorLaboral.objects.all()

        context['listado_motivos'] = motivos
        context['listado_departamentos'] = departamentos
        context['listado_ocupaciones'] = ocupacion
        context['lista_institucion'] = institucion
        context['listado_organizaciones'] = organizacion
        context['listado_sectores'] = sector
        context['listado_tipo'] = tipo
        context['listado_estado'] = estado
        context['list_mun'] = list_mun
        context['list_par'] = list_par
        # context['usuario'] = usuario
        return context


class EliminarSolicitud(DeleteView):
    template_name = 'registro/solicitud/eliminar.html'
    model = Registros
    success_url = reverse_lazy("lista")
    context_object_name = "listado"


class FinalizarVisita(UpdateView):

    def post(self, request, *args, **kwargs):
        response_data = {}
        fmt = '%Y-%m-%d %I:%M:%S'
        dat = datetime.datetime.now()
        fecha_sal = dat.strftime(fmt)
        print fecha_sal
        id_sol = self.request.POST.get('id') #id de la encuesta
        print "ID",id_sol
        Registros.objects.filter(id=id_sol).update(status='2', fecha_sal=fecha_sal)
        
        return HttpResponse('/menu/registros/solicitud/listar/')


def BuscarCedula(request):

    """ Metodo que en busca una cédula dada y verifica si está registrada en el modelo de responsables
    """
    # nacionalidad = request.GET['nacionalidad']
    cedula = request.GET['cedula']
    id_r = request.GET['id']
    response_data = []
    if id_r == '':
        responsable = Registros.objects.filter(cedula=cedula).exists()
        if responsable == True:
            datos = Registros.objects.filter(cedula=cedula).order_by('-id').values('estado', 'municipio','parroquia', 'tipo_edu', 'ocupacion',
                                                                   'sector_lab', 'organizacion', 'telefono', 'twitter')[:1]
        else:
            datos = ''

        tam = len(datos)
        i = 0
        while i < tam:
            response_data.append(datos[i])
            i += 1
        data = json.dumps(response_data)
        return HttpResponse(data, content_type='application/json')

    # return HttpResponse(datos, content_type='application/json')
#content_type='application/json'

def dictfetchall(cursor):
    "Returns all rows from a cursor as a dict"
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]


