# encoding:utf-8
from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import Institucion
from django.http import HttpResponse, HttpResponseRedirect
from .forms import InstitucionForm
from apps.topologia.estados.models import Estado
from apps.topologia.municipios.models import Municipio
from apps.topologia.parroquias.models import Parroquia
from apps.configuracion.dependencias.models import Dependencia
from django.core import serializers


class RegistrarInstitucion(CreateView):
    """ Vista basada en clase: (`Registrar`)

    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param success_url: nombre de la ruta a la cual se redireccionara la aplicacion una vez culminado el registro
        satisfactoriamente
    :param form_class: nombre de la clase Formulario
    """
    template_name = 'configuracion/institucion/institucion.html'
    model = Institucion
    success_url = reverse_lazy("listar_institucion")
    form_class = InstitucionForm

    def get_context_data(self, **kwargs):
        """ Vista basada en Clases con un metodo: (`Registrar`). """

        context = super(RegistrarInstitucion, self).get_context_data(**kwargs)
        listar_estado = Estado.objects.all()

        context['listar_estados'] = listar_estado

        return context

    def post(self, request, *args, **kwargs):
        bandera = request.POST.get('bandera')
        nom_institucion = request.POST.get('nom_institucion')
        existe = Institucion.objects.filter(nom_institucion=nom_institucion).exists()
        if existe and bandera == 'true':
            return HttpResponse('existe')
        else:
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            if form.is_valid():
                form.save()
                print "paso"
            return HttpResponseRedirect('/menu/configuraciones/instituciones/')


class ListarInstitucion(ListView):
    """ Vista basada en clase: (`Listar`)
    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param context_object_name: nombre del objeto que contiene esta vista
    """
    model = Institucion
    template_name = 'configuracion/institucion/listar.html'
    context_object_name = "listar_institucion"

    def post(self, request, *args, **kwargs):

        pk_inst = self.request.POST.get('pk')
        status = self.request.POST.get('institucion_activa')

        #  Validamos el status
        if status == 'false':
            status = False
        else:
            status = True

        #Buscamos el id(pk) del usuario en el modelo de Usuario
        institucion = Institucion.objects.filter(id=pk_inst)
        institucion.update(
            institucion_activa=status
        )
        return HttpResponse('exito')


class EditarInstitucion(UpdateView):
    """ Vista basada en clase: (`Editar`)

    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param success_url: nombre de la ruta a la cual se redireccionara la aplicacion una vez culminada la edición del
        registro satisfactoriamente
    :param context_object_name: nombre del objeto que contiene esta vista
    """
    model = Institucion
    template_name = 'configuracion/institucion/modificar.html'
    context_object_name = "editar_institucion"
    success_url = reverse_lazy("listar_institucion")

    def get_context_data(self, **kwargs):

        context = super(EditarInstitucion, self).get_context_data(**kwargs)
        pk_inst = self.kwargs['pk']
        institucion = Institucion.objects.all()
        cod_est = institucion.filter(pk=pk_inst).values('estado_id')
        cod_mun = institucion.filter(pk=pk_inst).values('municipio')
        # cod_parr = institucion.filter(pk=pk_inst).values('parroquia')

        list_estado = Estado.objects.all()
        list_mun = Municipio.objects.filter(estado_id=cod_est)
        list_par = Parroquia.objects.filter(estado_id=cod_est, municipio=cod_mun)

        context['list_estado'] = list_estado
        context['list_mun'] = list_mun
        context['list_par'] = list_par

        return context


class BorrarInstitucion(DeleteView):
    """ Vista basada en clase: ('Borrar')

    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param success_url: nombre de la ruta a la cual se redireccionara la aplicacion una vez eliminado el registro
        satisfactoriamente
    :param context_object_name: nombre del objeto que contiene esta vista
    """
    model = Institucion
    template_name = 'configuracion/institucion/borrar.html'
    context_object_name = "borrar_institucion"
    success_url = reverse_lazy("listar_institucion")

    # def get_context_data(self, **kwargs):
    #     context = super(BorrarInstitucion, self).get_context_data(**kwargs)
    #     pk_ins = self.kwargs['pk']
    #     institucion = Institucion.objects.all()
    #     id_est = institucion.filter(pk=pk_ins).values('id')
    # 
    #     dep = Dependencia.objects.all()
    #     existe = dep.filter(institucion_id=id_est)
    # 
    #     cantidad = len(existe)
    # 
    #     context['cantidad'] = cantidad
    #     return context


def BuscarDependencia(request):

    """ Metodo que en base al estado seleccionado se filtran los municipios pertenecientes a el y los datos
    serializados son validados en el metodo ajax para el ubicado en /static/js/validaciones.js
    """
    id_inst = request.GET['id']
    dependencia = Dependencia.objects.filter(institucion_id=id_inst)
    data = serializers.serialize('json', dependencia, fields=('id', 'nom_dependencia'))

    return HttpResponse(data, content_type='application/json')
