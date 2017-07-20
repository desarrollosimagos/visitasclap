from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
    url(r'^instituciones/', include('apps.configuracion.instituciones.urls')),
    url(r'tipo_educacion/', include('apps.configuracion.tipo_educacion.urls')),
    url(r'^dependencias/', include('apps.configuracion.dependencias.urls')),
    url(r'^sectores/', include('apps.configuracion.sector_laboral.urls')),
    url(r'^motivos/', include('apps.configuracion.motivo.urls')),
    url(r'^ocupaciones/', include('apps.configuracion.ocupacion.urls')),
    url(r'^organizaciones/', include('apps.configuracion.organizacion_social.urls')),
    url(r'^grupo_etareo/', include('apps.configuracion.grupo_etareo.urls')),
)