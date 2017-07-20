# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from .views import RegistrarSectorLaboral, ListarSectorLaboral, EditarSectorLaboral, EliminarSectorLaboral
from django.contrib.auth.decorators import login_required

urlpatterns = patterns('',
    url(r'registro/$', login_required(RegistrarSectorLaboral.as_view(),
        login_url='/'), name='registro_sectores'),
    url(r'listar/$', login_required(ListarSectorLaboral.as_view(), login_url='/')
        , name='listar_sectores'),
    url(r'editar/(?P<pk>\d+)$', login_required(EditarSectorLaboral.as_view(), login_url='/'),name='editar_sectores'),
    url(r'eliminar/(?P<pk>\d+)$', login_required(EliminarSectorLaboral.as_view(), login_url='/'),name='eliminar_sectores'),
    url(r'^data/', 'apps.configuracion.sector_laboral.views.load_data', name="datos_sectores",),  # URL de Importación para la data
    )