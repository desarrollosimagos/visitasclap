from django.db import models
from apps.topologia.estados.models import Estado
from django.contrib.auth.models import User
from apps.configuracion.instituciones.models import Institucion


class Dependencia(models.Model):
    """ Clase que define todo lo referente a los `Estados`:
    Registrar, Modificar, Eliminar y Consultar

    :param IntegerField cod_estado: campo donde se coloca el codigo del Estado.
    :param CharField estado: campo donde ingresas el nombre del Estado.
    """
    
    institucion = models.ForeignKey(Institucion)
    nom_dependencia = models.CharField(max_length=125)
    siglas = models.CharField(max_length=15)
    correo = models.CharField(max_length=100, null=True,)
    dependencia_activa = models.BooleanField(default=False)

    #  Auditoria
    user_create = models.ForeignKey(User, null=True, blank=True, related_name='+')
    user_update = models.ForeignKey(User, null=True, blank=True, related_name='+')
    fecha_create = models.DateTimeField(auto_now_add=True,)
    fecha_update = models.DateTimeField(auto_now_add=False, auto_now=True, null=True)

    class Meta:
        """ Ordena los registros en base a el campo cod_estado."""
        ordering = ('institucion','nom_dependencia',)  # Ordenado por

    def __unicode__(self):
        return self.nom_dependencia

    def get_absolute_url(self):
        return ('listar_idependencia', [self.id, ])
