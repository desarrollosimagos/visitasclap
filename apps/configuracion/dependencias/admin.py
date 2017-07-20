from django.contrib import admin
from .models import Dependencia


class DependenciaAdmin(admin.ModelAdmin):
    """
    :param list_display: Muesta el str de los campos en la vista lista
    :param search_fields: Crea un campo para busqueda directa
    """
    fieldsets = [
        ('Informacion Principal', {'fields': ['institucion', 'nom_dependencia', 'siglas', 'correo', 'dependencia_activa']}),
        ('Auditoria', {'fields': ['user_create', 'user_update']})]
    list_display = ('institucion', 'nom_dependencia', 'siglas', 'dependencia_activa')
    list_filter = ['nom_dependencia']
    search_fields = ['institucion', 'nom_dependencia']

admin.site.register(Dependencia, DependenciaAdmin)
