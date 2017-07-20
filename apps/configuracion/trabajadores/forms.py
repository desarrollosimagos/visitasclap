#encoding:utf-8
from django.forms import ModelForm
from django import forms
from .models import Trabajadores


class TrabajadoresForm(forms.ModelForm):
    """ Clase de donde se define la estructura del formulario `Trabajadores`."""

    class Meta:
        """
        Llamado del modelo
        """
        model = Trabajadores
