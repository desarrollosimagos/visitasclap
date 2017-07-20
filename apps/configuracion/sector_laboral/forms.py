#encoding:utf-8
from django.forms import ModelForm
from django import forms
from .models import SectorLaboral


class SectorLaboralForm(forms.ModelForm):
    """ Clase de donde se define la estructura del formulario `SectorLaboral`."""

    class Meta:
        """
        Llamado del modelo
        """
        model = SectorLaboral
