from django.conf.urls import patterns, include, url
from .views import RegistrarSolicitud, ListarSolicitud, ActualizarSolicitud, EliminarSolicitud, FinalizarVisita
from django.contrib.auth.decorators import login_required


urlpatterns = patterns('',
    #url(r'registro/$', RegistrarSolicitud.as_view(),name='registrar'),
    url(r'registro/$', login_required(RegistrarSolicitud.as_view(),login_url='/'),name='registrar'),
    url(r'listar/$', login_required(ListarSolicitud.as_view(),login_url='/'),name='lista'),
    url(r'editar/(?P<pk>\d+)$', login_required(ActualizarSolicitud.as_view(),login_url='/'),name='actualizar'),
    url(r'elimina/(?P<pk>\d+)$', login_required(EliminarSolicitud.as_view(),login_url='/'),name='eliminar'),
    url(r'^finalizar/$', login_required(FinalizarVisita.as_view(),login_url='/'), name='finalizar_visita'),
    url(r'^busqueda_cedula/$', 'apps.registro.solicitud.views.BuscarCedula', name='busqueda_cedula'),
)
