# -*- coding: utf-8 -*-
from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import Ocupaciones
from .forms import OcupacionesForm
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
import os
import csv
from django.conf import settings



class RegistrarOcupaciones(CreateView):
    template_name = 'configuracion/ocupacion/registro.html'
    model = Ocupaciones
    success_url = reverse_lazy("listar_ocupaciones")
    form_class = OcupacionesForm

    def post(self, request, *args, **kwargs):
        bandera = request.POST.get('bandera')
        ocupacion = request.POST.get('ocupacion')
        existe_ocupacion = Ocupaciones.objects.filter(ocupacion=ocupacion).exists()
        
        if existe_ocupacion and bandera == 'true':
            return HttpResponse('existe')
        else:
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            if form.is_valid():
                form.save()
            return HttpResponseRedirect('/menu/configuraciones/ocupaciones/listar/')


class ListarOcupaciones(ListView):
    template_name = 'configuracion/ocupacion/listar.html'
    model = Ocupaciones
    context_object_name = "listar_ocupacion"


class EditarOcupaciones(UpdateView):
    template_name = 'configuracion/ocupacion/editar.html'
    model = Ocupaciones
    success_url = reverse_lazy("listar_ocupacion")
    context_object_name = "editar_ocupacion"

    def post(self, request, *args, **kwargs):
        id_r = request.POST.get('id')
        bandera = request.POST.get('bandera')
        ocupacion = request.POST.get('ocupacion')
        existe_ocupacion = Ocupaciones.objects.filter(ocupacion=ocupacion).exclude(id=id_r).exists()

        if existe_ocupacion and bandera == 'true':
            return HttpResponse('existe')
        else:
            Ocupaciones.objects.filter(id=id_r).update(ocupacion=ocupacion)

            return HttpResponseRedirect('/menu/configuraciones/ocupaciones/listar/')


class EliminarOcupaciones(DeleteView):
    template_name = 'configuracion/ocupacion/eliminar.html'
    model = Ocupaciones
    success_url = reverse_lazy("listar_ocupacion")
    context_object_name = "borrar_ocupacion"


@login_required(login_url='/')
def load_data(request):
    """
    Función para la carga de la data por defecto del módulo de Ocupaciones.
    :param DIR_URL: variable que almacena la ruta del proyecto.
    """
    os.path.dirname(os.path.abspath(__file__))
    DIR_URL = settings.BASE_DIR
    reader = csv.reader(open(DIR_URL+str("/apps/configuracion/ocupacion/script/ocupaciones_profeciones.csv")))
    # Recorrido de los registros
    for row in reader:

        data = row[0].split(';')
        consulta_sec = Ocupaciones.objects.filter(ocupacion=data[0])
        if consulta_sec:
            print "Ya existe..."
        else:
            org = Ocupaciones(
                ocupacion=data[0],
                )
            org.save()

    return HttpResponseRedirect('/menu/configuraciones/ocupaciones/listar/')
