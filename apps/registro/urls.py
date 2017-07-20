from django.conf.urls import patterns, include, url


urlpatterns = patterns('',
                       url(r'solicitud/', include('apps.registro.solicitud.urls')),
)