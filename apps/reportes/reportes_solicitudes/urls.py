from django.conf.urls import patterns, include, url
from .views import ReporteSolicitudes, Reporte, Ficha
from django.contrib.auth.decorators import login_required


urlpatterns = patterns('',
                       url(r'^$', login_required(ReporteSolicitudes.as_view(),login_url='/'), name='reporte_template'),
                       url(r'^reporte/$', login_required(Reporte.as_view(),login_url='/'), name='reporte_generales'),
                       url(r'^ficha/$', login_required(Ficha.as_view(),login_url='/'), name='reporte_personal'),
                      )