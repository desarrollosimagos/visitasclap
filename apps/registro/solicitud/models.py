# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User
from apps.topologia.estados.models import Estado
from apps.configuracion.instituciones.models import Institucion
from apps.configuracion.tipo_educacion.models import TipoEducacion
from apps.configuracion.dependencias.models import Dependencia
from apps.configuracion.ocupacion.models import Ocupaciones
from apps.configuracion.sector_laboral.models import SectorLaboral
from apps.configuracion.organizacion_social.models import Organizaciones
from apps.configuracion.motivo.models import Motivos


SEXO = (
    ('0', "Seleccione"),
    ('1', "Femenino"),
    ('2', "Masculino"),
)
STATUS = (
    ('1', "En Proceso"),
    ('2', "Finalizada"),
)


class Registros(models.Model):

    codigo = models.CharField(max_length=50)
    fecha_sal = models.DateTimeField(null=True, blank=True)
    fecha_ent = models.DateTimeField(auto_now_add=False, auto_now=False, null=True, blank=True)
    cedula = models.IntegerField()
    nombre = models.CharField(max_length=50,)
    apellido = models.CharField(max_length=50,)
    sexo = models.CharField(choices=SEXO, default=0, max_length=1)
    edad = models.IntegerField()
    telefono = models.CharField(max_length=11,)
    twitter = models.CharField(max_length=80, null=True, blank=True)
    tipo_edu = models.ForeignKey(TipoEducacion)
    estado = models.ForeignKey(Estado, to_field='cod_estado', on_delete=models.SET_NULL, related_name='institucion_estado', null=True)
    parroquia = models.IntegerField()
    municipio = models.IntegerField()
    direcc_es = models.TextField(null=True, blank=True)
    descripcion = models.TextField(null=True, blank=True)
    ocupacion = models.ForeignKey(Ocupaciones)
    sector_lab = models.ForeignKey(SectorLaboral)
    organizacion = models.ForeignKey(Organizaciones)
    departamento = models.ForeignKey(Dependencia)
    institucion = models.ForeignKey(Institucion)
    motivo = models.ForeignKey(Motivos)
    status = models.CharField(choices=STATUS, default=1, max_length=2)
    codigo_centro = models.IntegerField(max_length=25,null=True, blank=True)
    nombre_centro = models.CharField(max_length=150, null=True, blank=True)
    # # Auditoria
    user_create = models.ForeignKey(User, null=True, blank=True, related_name='+')
    # user_update = models.ForeignKey(User, null=True, blank=True, related_name='+')
