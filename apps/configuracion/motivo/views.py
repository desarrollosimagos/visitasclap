from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import Motivos
from .forms import MotivosForm
from django.http import HttpResponse, HttpResponseRedirect
import os
import csv
from django.conf import settings

class RegistrarMotivos(CreateView):
    template_name = 'configuracion/motivo/registro.html'
    model = Motivos
    success_url = reverse_lazy("listar_motivos")
    form_class = MotivosForm

    def post(self, request, *args, **kwargs):
        bandera = request.POST.get('bandera')
        motivo = request.POST.get('motivo')
        existe_motivo = Motivos.objects.filter(motivo=motivo).exists()
        
        if existe_motivo and bandera == 'true':
            return HttpResponse('existe')
        else:
            form_class = self.get_form_class()
            form = self.get_form(form_class)
            if form.is_valid():
                form.save()
            return HttpResponseRedirect('/menu/configuraciones/motivos/listar/')


class ListarMotivos(ListView):
    template_name = 'configuracion/motivo/listar.html'
    model = Motivos
    context_object_name = "listar_motivo"


class EditarMotivos(UpdateView):
    template_name = 'configuracion/motivo/editar.html'
    model = Motivos
    success_url = reverse_lazy("listar_motivos")
    context_object_name = "editar_motivo"

    def post(self, request, *args, **kwargs):
        id_r = request.POST.get('id')
        bandera = request.POST.get('bandera')
        motivo = request.POST.get('motivo')
        existe_motivo = Motivos.objects.filter(motivo=motivo).exclude(id=id_r).exists()

        if existe_motivo and bandera == 'true':
            return HttpResponse('existe')
        else:
            Motivos.objects.filter(id=id_r).update(motivo=motivo)

            return HttpResponseRedirect('/menu/configuraciones/motivos/listar/')


class EliminarMotivos(DeleteView):
    template_name = 'configuracion/motivo/eliminar.html'
    model = Motivos
    success_url = reverse_lazy("listar_motivo")
    context_object_name = "borrar_motivo"
    
