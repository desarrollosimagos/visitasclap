#encoding:utf-8
from django.forms import ModelForm
from django import forms
from .models import Ocupaciones


class OcupacionesForm(forms.ModelForm):
    """ Clase de donde se define la estructura del formulario `Ocupaciones`."""

    class Meta:
        """
        Llamado del modelo
        """
        model = Ocupaciones
