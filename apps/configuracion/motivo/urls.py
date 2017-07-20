from django.conf.urls import patterns, include, url
from .views import RegistrarMotivos, ListarMotivos, EditarMotivos, EliminarMotivos
from django.contrib.auth.decorators import login_required

urlpatterns = patterns('',
    url(r'registro/$', login_required(RegistrarMotivos.as_view(),login_url='/'),name='registro_motivo'),
    url(r'listar/$', login_required(ListarMotivos.as_view(),login_url='/'),name='listar_motivo'),
    url(r'editar/(?P<pk>\d+)$', login_required(EditarMotivos.as_view(),login_url='/'),name='editar_motivo'),
    url(r'eliminar/(?P<pk>\d+)$', login_required(EliminarMotivos.as_view(),login_url='/'),name='eliminar_motivo'),
    )
