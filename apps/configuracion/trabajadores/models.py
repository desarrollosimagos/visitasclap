from django.db import models
from apps.configuracion.instituciones.models import Institucion
from django.contrib.auth.models import User


class Trabajadores(models.Model):

    trabajador = models.ForeignKey(User)
    institucion = models.ForeignKey(Institucion)
