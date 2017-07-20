from .models import Dependencia
from .serializers import DependenciaSerializer
from rest_framework import serializers, viewsets


class DependenciaViewSet(viewsets.ModelViewSet):
    """
        Clase que construye la vista de los `serializers`
    """
    serializer_class = DependenciaSerializer
    queryset = Dependencia.objects.all()
