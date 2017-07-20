from django.conf.urls import patterns, include, url
from .views import ListarDependencia, RegistrarDependencia, EditarDependencia, BorrarDependencia
from django.contrib.auth.decorators import login_required


"""
    Urls para ingresar a la aplicacion dependencias, permitiendo visualizar los registros, crearlos, editarlos y borrarlos.
"""
urlpatterns = patterns('',
                       url(r'^$', login_required(ListarDependencia.as_view(template_name="configuracion/dependencia/listar.html"),
                                                 login_url='/'), name='listar_dependencia'),
                       url(r'^registrardependencia/$', login_required(RegistrarDependencia.as_view(template_name="configuracion/dependencia/dependencia.html"),
                                                 login_url='/'), name='registrar_dependencia'),
                       url(r'^editardependencia/(?P<pk>\d+)/$', login_required(EditarDependencia.as_view(template_name="configuracion/dependencia/modificar.html"),
                                                 login_url='/'), name='editar_dependencia'),
                       url(r'^borrardependencia/(?P<pk>\d+)/$', login_required(BorrarDependencia.as_view(template_name="configuracion/dependencia/borrar.html"),
                                                 login_url='/'), name='borrar_dependencia'),
                       )
