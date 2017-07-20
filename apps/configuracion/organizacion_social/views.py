# -*- coding: utf-8 -*-
from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import Organizaciones
from .forms import OrganizacionesForm
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
import os
import csv
from django.conf import settings


class RegistrarOrganizaciones(CreateView):
    template_name = 'configuracion/organizacion/registro.html'
    model = Organizaciones
    success_url = reverse_lazy("listar_organizaciones")
    form_class = OrganizacionesForm

    def post(self, request, *args, **kwargs):
        bandera = request.POST.get('bandera')
        organizacion = request.POST.get('organizacion')
        existe_organizacion = Organizaciones.objects.filter(organizacion=organizacion).exists()
        
        if existe_organizacion and bandera == 'true':
            return HttpResponse('existe')
        else:
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            if form.is_valid():
                form.save()
            return HttpResponseRedirect('/menu/configuraciones/organizaciones/listar/')


class ListarOrganizaciones(ListView):
    template_name = 'configuracion/organizacion/listar.html'
    model = Organizaciones
    context_object_name = "listar_organizacion"


class EditarOrganizaciones(UpdateView):
    template_name = 'configuracion/organizacion/editar.html'
    model = Organizaciones
    success_url = reverse_lazy("listar_organizaciones")
    context_object_name = "editar_organizacion"

    def post(self, request, *args, **kwargs):
        id_r = request.POST.get('id')
        bandera = request.POST.get('bandera')
        organizacion = request.POST.get('organizacion')
        existe_organizacion = Organizaciones.objects.filter(organizacion=organizacion).exclude(id=id_r).exists()

        if existe_organizacion and bandera == 'true':
            return HttpResponse('existe')
        else:
            Organizaciones.objects.filter(id=id_r).update(organizacion=organizacion)

            return HttpResponseRedirect('/menu/configuraciones/organizaciones/listar/')


class EliminarOrganizaciones(DeleteView):
    template_name = 'configuracion/organizacion/eliminar.html'
    model = Organizaciones
    success_url = reverse_lazy("listar_organizacion")
    context_object_name = "borrar_organizacion"


@login_required(login_url='/')
def load_data(request):
    """
    Función para la carga de la data por defecto del módulo de Organizaciones.
    :param DIR_URL: variable que almacena la ruta del proyecto.
    """
    os.path.dirname(os.path.abspath(__file__))
    DIR_URL = settings.BASE_DIR
    reader = csv.reader(open(DIR_URL+str("/apps/configuracion/organizacion_social/script/organizaciones_sociales.csv")))
    # Recorrido de los registros
    for row in reader:

        data = row[0].split(';')
        consulta_sec = Organizaciones.objects.filter(organizacion=data[0])
        if consulta_sec:
            print "Ya existe..."
        else:
            org = Organizaciones(
                organizacion=data[0],
                )
            org.save()

    return HttpResponseRedirect('/menu/configuraciones/organizaciones/listar/')
