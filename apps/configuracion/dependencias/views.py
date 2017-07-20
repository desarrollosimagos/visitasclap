# encoding:utf-8
from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import Dependencia
from django.http import HttpResponse, HttpResponseRedirect
from .forms import DependenciaForm
from apps.configuracion.instituciones.models import Institucion


class RegistrarDependencia(CreateView):
    """ Vista basada en clase: (`Registrar`)

    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param success_url: nombre de la ruta a la cual se redireccionara la aplicacion una vez culminado el registro
        satisfactoriamente
    :param form_class: nombre de la clase Formulario
    """
    template_name = 'configuracion/dependencia/dependencia.html'
    model = Dependencia
    success_url = reverse_lazy("listar_dependencia")
    form_class = DependenciaForm

    def get_context_data(self, **kwargs):
        """ Vista basada en Clases con un metodo: (`Registrar`). """

        context = super(RegistrarDependencia, self).get_context_data(**kwargs)
        listar_institucion = Institucion.objects.all()

        context['listar_institucion'] = listar_institucion

        return context

    def post(self, request, *args, **kwargs):
        bandera = request.POST.get('bandera')
        nom_dependencia = request.POST.get('nom_dependencia')
        existe = Dependencia.objects.filter(nom_dependencia=nom_dependencia).exists()
        if existe and bandera == 'true':
            return HttpResponse('existe')
        else:
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            if form.is_valid():
                form.save()
            return HttpResponseRedirect('/menu/configuraciones/dependencias/')


class ListarDependencia(ListView):
    """ Vista basada en clase: (`Listar`)
    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param context_object_name: nombre del objeto que contiene esta vista
    """
    model = Dependencia
    template_name = 'configuracion/dependencia/listar.html'
    context_object_name = "listar_dependencia"

    def post(self, request, *args, **kwargs):

        pk_inst = self.request.POST.get('pk')
        status = self.request.POST.get('dependencia_activa')

        #Validamos el status
        if status == 'false':
            status = False
        else:
            status = True

        #Buscamos el id(pk) del usuario en el modelo de Usuario
        dependencia = Dependencia.objects.filter(id=pk_inst)
        dependencia.update(
            dependencia_activa=status
        )
        return HttpResponse('exito')


class EditarDependencia(UpdateView):
    """ Vista basada en clase: (`Editar`)

    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param success_url: nombre de la ruta a la cual se redireccionara la aplicacion una vez culminada la edición del
        registro satisfactoriamente
    :param context_object_name: nombre del objeto que contiene esta vista
    """
    model = Dependencia
    template_name = 'configuracion/dependencia/modificar.html'
    context_object_name = "editar_dependencia"
    success_url = reverse_lazy("listar_dependencia")

    def get_context_data(self, **kwargs):

        context = super(EditarDependencia, self).get_context_data(**kwargs)
        list_institucion = Institucion.objects.all()

        context['list_institucion'] = list_institucion

        return context


class BorrarDependencia(DeleteView):
    """ Vista basada en clase: ('Borrar')

    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param success_url: nombre de la ruta a la cual se redireccionara la aplicacion una vez eliminado el registro
        satisfactoriamente
    :param context_object_name: nombre del objeto que contiene esta vista
    """
    model = Dependencia
    template_name = 'configuracion/dependencia/borrar.html'
    context_object_name = "borrar_dependencia"
    success_url = reverse_lazy("listar_dependencia")
# 
#     def get_context_data(self, **kwargs):
#         context = super(BorrarDependencia, self).get_context_data(**kwargs)
#         pk_est = self.kwargs['pk']
#         dependencia = Dependencia.objects.all()
#         id_est = dependencia.filter(pk=pk_est).values('cod_dependencia')
#     
#         mun = Municipio.objects.all()
#         existe = mun.filter(dependencia_id=id_est)
#         cantidad = len(existe)
#     
#         context['cantidad'] = cantidad
#         return context
