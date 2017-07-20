# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from .views import RegistrarOrganizaciones, ListarOrganizaciones, EditarOrganizaciones, EliminarOrganizaciones
from django.contrib.auth.decorators import login_required


urlpatterns = patterns('',
    url(r'registro/$', login_required(RegistrarOrganizaciones.as_view(),login_url='/'),name='registro_organizacion'),
    url(r'listar/$', login_required(ListarOrganizaciones.as_view(), login_url='/'),name='listar_organizacion'),
    url(r'editar/(?P<pk>\d+)$', login_required(EditarOrganizaciones.as_view(), login_url='/'),name='editar_organizacion'),
    url(r'eliminar/(?P<pk>\d+)$', login_required(EliminarOrganizaciones.as_view(), login_url='/'),name='eliminar_organizacion'),
    url(r'^data/', 'apps.configuracion.organizacion_social.views.load_data', name="datos_organizaciones",),  # URL de Importación para la data
    )