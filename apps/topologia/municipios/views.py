#encoding:utf-8

from django.views.generic import CreateView, ListView, UpdateView, DeleteView, FormView
from django.core.urlresolvers import reverse_lazy
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger  # Paginacion
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from apps.topologia.estados.models import Estado
from .models import Municipio
from .forms import MunicipioForm
from django.core import serializers
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import Group, Permission, User
from django.utils.decorators import method_decorator
from apps.topologia.parroquias.models import Parroquia
import os
import csv
from django.conf import settings


@login_required(login_url='/')
def RegistrarMunicipio(request):
    """
        Vista basada en Metodos o funciones: (`Registrar`)
    """
    lista_estado = Estado.objects.all()
    mun = Municipio.objects.all()
    count_m = len(mun) + 1
    if request.method == 'POST':
        bandera = request.POST.get('bandera')
        cod_municipio = request.POST.get('cod_municipio')
        estado = request.POST.get('estado')
        municipio = request.POST.get('municipio')
        existe_c = Municipio.objects.filter(estado=estado, cod_municipio=cod_municipio).exists()
        existe_n = Municipio.objects.filter(estado=estado, municipio=municipio).exists()
        existe_t = Municipio.objects.filter(estado=estado, cod_municipio=cod_municipio, municipio=municipio).exists()
        if existe_t and bandera == 'true':
            return HttpResponse('existe_t')
        elif existe_c and bandera == 'true':
            return HttpResponse('existe_c')
        elif existe_n and bandera == 'true':
            return HttpResponse('existe_n')
        else:
            form_reg_mun = MunicipioForm(request.POST, request.FILES)
            if form_reg_mun.is_valid():
                new_reg_mun = form_reg_mun.save(commit=False)
                new_reg_mun.save()
            return HttpResponseRedirect('/menu/topologia/municipios/')
    else:
        form_reg_mun = MunicipioForm()
    ctx = {'form_reg_mun': form_reg_mun, 'lista_estado': lista_estado, 'count_m': count_m}
    return render_to_response('topologia/municipios/municipios.html',
                              ctx, context_instance=RequestContext(request))


@login_required(login_url='/')
def ActualizarMunicipio(request, pk):
    """ Vista basada en Metodos o funciones: (`Modificar`). """
    obj_reg_mun = Municipio.objects.get(id=pk)
    lista_estado = Estado.objects.all()
    # lista_circuito = Circuito.objects.filter(estado_id=obj_reg_mun.estado_id)
    if request.method == 'POST':
        bandera = request.POST.get('bandera')
        cod_municipio = request.POST.get('cod_municipio')
        estado = request.POST.get('estado')
        existe = Municipio.objects.filter(cod_municipio=cod_municipio, estado=estado).exists()

        if existe and bandera == 'true':
            return HttpResponse('existe')
        else:
            form_reg_mun = MunicipioForm(request.POST, request.FILES, instance=obj_reg_mun)
            if form_reg_mun.is_valid():
                edit_reg_mun = form_reg_mun.save(commit=False)
                edit_reg_mun.save()
            return HttpResponseRedirect('/menu/topologia/municipios/')
    else:
        form_reg_mun = MunicipioForm(instance=obj_reg_mun)
    ctx = {'form_reg_mun': form_reg_mun, 'obj_reg_mun': obj_reg_mun, 'lista_estado': lista_estado,}  # ctx = Contexto
    return render_to_response('topologia/municipios/modificar.html',
                              ctx, context_instance=RequestContext(request))


class ListarMunicipio(ListView):
    """ Vista basada en clase: (`Listar`)

    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param context_object_name: nombre del objeto que contiene esta vista
    :param paginate_by: Genera la paginacion de los registros en base a la cantidad definida.
    """
    model = Municipio
    template_name = 'topologia/municipios/listar.html'
    context_object_name = "listar_municipio"


class BorrarMunicipio(DeleteView):
    """ Vista basada en clase: (`Borrar`)

    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    :param success_url: nombre de la ruta a la cual se redireccionara la aplicacion una vez eliminado el registro
        satisfactoriamente
    :param context_object_name: nombre del objeto que contiene esta vista
    """
    model = Municipio
    template_name = 'topologia/municipios/borrar.html'
    context_object_name = "borrar_municipio"
    success_url = reverse_lazy("listar_municipio")

    def get_context_data(self, **kwargs):
        context = super(BorrarMunicipio, self).get_context_data(**kwargs)
        pk_mun = self.kwargs['pk']
        municipio = Municipio.objects.all()
        id_mun = municipio.filter(pk=pk_mun).values('cod_municipio')
        
        par = Parroquia.objects.all()
        existe = par.filter(municipio=id_mun)
        cantidad = len(existe)
    
        context['cantidad'] = cantidad
        return context


@login_required(login_url='/')
def load_data(request):
    """
    Funcion para la carga de la data por defecto del modulo de estados.

    :param DIR_URL: variable que almacena la ruta del proyecto.
    :param x: variable que contiene la fecha y hora actual.
    :param reg_bitacora: variable que contiene la asignacion de un nuevo registro al modelo Bitacora.
    """

    os.path.dirname(os.path.abspath(__file__))
    # DIR_URL = os.getcwd()
    DIR_URL = settings.BASE_DIR
    reader = csv.reader(open(DIR_URL+str("/apps/topologia/municipios/script/municipios.csv")))

    # Recorrido de los registros
    for row in reader:
        data = row[0].split(';')
        municipio = Municipio.objects.filter(estado_id=data[0],cod_municipio=data[1])
        if municipio:
            # return HttpResponseRedirect('/menu/topologia/municipios/')
            print "Ya existe..."
        else:
            centro = Municipio(
                estado_id = data[0],
                cod_municipio = data[1],
                municipio = data[2],
                )
            centro.save()

    return HttpResponseRedirect('/menu/topologia/municipios/')