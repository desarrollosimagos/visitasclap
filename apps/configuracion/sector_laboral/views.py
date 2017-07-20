# -*- coding: utf-8 -*-
from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import SectorLaboral
from .forms import SectorLaboralForm
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
import os
import csv
from django.conf import settings


class RegistrarSectorLaboral(CreateView):
    template_name = 'configuracion/sectores/registro.html'
    model = SectorLaboral
    success_url = reverse_lazy("listar_sectores")
    form_class = SectorLaboralForm

    def post(self, request, *args, **kwargs):
        bandera = request.POST.get('bandera')
        sector = request.POST.get('sector')
        existe_sector = SectorLaboral.objects.filter(sector=sector).exists()
        
        if existe_sector and bandera == 'true':
            return HttpResponse('existe')
        else:
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            if form.is_valid():
                form.save()
            return HttpResponseRedirect('/menu/configuraciones/sectores/listar/')


class ListarSectorLaboral(ListView):
    template_name = 'configuracion/sectores/listar.html'
    model = SectorLaboral
    context_object_name = "listar_sectores"


class EditarSectorLaboral(UpdateView):
    template_name = 'configuracion/sectores/editar.html'
    model = SectorLaboral
    success_url = reverse_lazy("listar_sectores")
    context_object_name = "editar_sectores"

    def post(self, request, *args, **kwargs):
        id_r = request.POST.get('id')
        bandera = request.POST.get('bandera')
        sector = request.POST.get('sector')
        existe_sector = SectorLaboral.objects.filter(sector=sector).exclude(id=id_r).exists()

        if existe_sector and bandera == 'true':
            return HttpResponse('existe')
        else:
            SectorLaboral.objects.filter(id=id_r).update(sector=sector)

            return HttpResponseRedirect('/menu/configuraciones/sectores/listar/')


class EliminarSectorLaboral(DeleteView):
    template_name = 'configuracion/sectores/eliminar.html'
    model = SectorLaboral
    success_url = reverse_lazy("listar_sectores")
    context_object_name = "borrar_sectores"


@login_required(login_url='/')
def load_data(request):
    """
    Función para la carga de la data por defecto del módulo de ejes.

    :param DIR_URL: variable que almacena la ruta del proyecto.
    """

    #os.path.dirname(os.path.abspath(__file__))

    DIR_URL = settings.BASE_DIR
    reader = csv.reader(open(DIR_URL+str("/apps/configuracion/sector_laboral/script/sectores_laborales.csv")))
    # Recorrido de los registros
    for row in reader:
        
        data = row[0].split(';')
        consulta_sec = SectorLaboral.objects.filter(sector=data[0])
        if consulta_sec:
            print "Ya existe..."
        else:
            sec = SectorLaboral(
                sector=data[0],
                )
            sec.save()

    return HttpResponseRedirect('/menu/configuraciones/sectores/listar/')
