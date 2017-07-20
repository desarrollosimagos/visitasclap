#encoding:utf-8
from django.forms import ModelForm
from django import forms
from .models import Motivos


class MotivosForm(forms.ModelForm):
    """ Clase de donde se define la estructura del formulario `Motivos`."""

    class Meta:
        """
        Llamado del modelo
        """
        model = Motivos
