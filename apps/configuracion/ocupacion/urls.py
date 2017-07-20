# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from .views import RegistrarOcupaciones, ListarOcupaciones, EditarOcupaciones, EliminarOcupaciones
from django.contrib.auth.decorators import login_required


urlpatterns = patterns('',
    url(r'registro/$', login_required(RegistrarOcupaciones.as_view(),login_url='/'),name='registro_ocupacion'),
    url(r'listar/$', login_required(ListarOcupaciones.as_view(),login_url='/'),name='listar_ocupacion'),
    url(r'editar/(?P<pk>\d+)$', login_required(EditarOcupaciones.as_view(),login_url='/'),name='editar_ocupacion'),
    url(r'eliminar/(?P<pk>\d+)$', login_required(EliminarOcupaciones.as_view(),login_url='/'),name='eliminar_ocupacion'),
    url(r'^data/', 'apps.configuracion.ocupacion.views.load_data', name="datos_ocupaciones",),  # URL de Importación para la data
    )
