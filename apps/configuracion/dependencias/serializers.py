from rest_framework import serializers
from .models import Dependencia


class DependenciaSerializer(serializers.ModelSerializer):
    """
        Clase donde llamamos al modelo `Dependencia` y serializamos los campos
    """
    class Meta:
        model = Dependencia
        fields = ('id', 'institucion', 'nom_dependencia', 'siglas', 'correo',
                  'dependencia_activa',
                  'user_create', 'user_update', 'fecha_create', 'fecha_update')