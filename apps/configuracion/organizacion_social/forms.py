#encoding:utf-8
from django.forms import ModelForm
from django import forms
from .models import Organizaciones


class OrganizacionesForm(forms.ModelForm):
    """ Clase de donde se define la estructura del formulario `Organizaciones`."""

    class Meta:
        """
        Llamado del modelo
        """
        model = Organizaciones
