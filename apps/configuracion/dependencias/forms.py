#encoding:utf-8
from django.forms import ModelForm
from django import forms
from .models import Dependencia


class DependenciaForm(forms.ModelForm):
    """ Clase de donde se define la estructura del formulario 'Dependencia'."""

    class Meta:
        """
        Llamado del modelo
        """
        model = Dependencia
