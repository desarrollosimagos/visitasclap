# -*- coding: utf-8 -*-
import hashlib
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.core.urlresolvers import reverse_lazy
from django.views.generic import ListView, FormView, CreateView
from django.contrib import messages  # Metodo para la validacion de los campos
from apps.login.forms import LoginForm, UserForm
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.http import HttpResponseRedirect
from .models import PerfilesUsuario, User
import datetime
from apps.configuracion.instituciones.models import Institucion
from django.contrib.auth.models import User, Group
from passlib.hash import django_pbkdf2_sha256 as handler # Proceso para encriptar las contrasena
from django.db import connection, transaction # Cursor de django
from django.http import HttpResponseRedirect, HttpResponse
import json
from apps.configuracion.instituciones.models import Institucion
from apps.configuracion.trabajadores.models import Trabajadores


def login_view(request):
    """ Vista basada en Metodos o funciones: (`Ingresar`)
    Donde validamos que el usuario y la contraseña del mismo son validos de lo contrario se emite un mensaje.
    """
    mensaje = ""

    if request.user.is_authenticated():
        return HttpResponseRedirect('/menu/')
    else:
        if request.method == "POST":
            form = LoginForm(request.POST)
            if form.is_valid():
                username = form.cleaned_data['username']
                password = form.cleaned_data['password']
                usuario = authenticate(username=username, password=password)
                if usuario is not None and usuario.is_active:
                    login(request, usuario)
                    return HttpResponseRedirect('/menu/')
                else:
                    mensaje = "Usuario y/o Contraseña incorrecto"
        form = LoginForm()
        ctx = {'form': form, 'mensaje': mensaje}
        return render_to_response('login/login.html', ctx, context_instance=RequestContext(request))


class RegistrarseUsuario(CreateView):
    """ Vista basada en clase: ('Registrar')
    :param template_name: ruta de la plantilla
    :param model: Modelo al cual se hace referencia
    """
    template_name = 'login/nuevo_usuario.html'
    model = User

    def post(self, request, *args, **kwargs):

        username = self.request.POST.get('username')
        password = handler.encrypt(self.request.POST.get('password'))
        email = self.request.POST.get('email')
        first_name = self.request.POST.get('first_name')
        last_name = self.request.POST.get('last_name')
        grupo = self.request.POST.getlist('grupo')
        accion = self.request.POST.get('accion')
        institucion = self.request.POST.get('institucion')
 
        #  Bloque para la busqueda de usuario con contrasena y poder ser comparada con la db
        if accion == "buscar":
            print "PASO POR VERIFICAR"
            username = self.request.POST.get('id_fis')
            password = self.request.POST.get('password')
            password_f = self.request.POST.get('password_f')
            clave = handler.encrypt(password)

            print "ID usuario: ",username
            print "CLAVE: ",password

            usuario = authenticate(username=username, password=password_f)
            if not usuario:
                return HttpResponse('no_existe')
            else:
                print "Ya existe"

                # Query para permitir la actualizacion de la clave del fiscal
                query = User.objects.all()
                obj = query.filter(username=username)
                obj.update(
                    password = clave,
                    is_staff = True,
                )
                logout(request)
                return HttpResponseRedirect('/')

        elif accion == "guardar":
            existe = User.objects.filter(username = username).exists()
            if existe:
                return HttpResponse('existe')
            else:
                if str(self.request.POST.get('is_active')) == '1':
                    status = True
                else:
                    status = False
                reg_obj = User(
                     username=username,
                     password=password,
                     last_login='2015-05-22 12:54:43.001975-04:30',
                     is_superuser='TRUE',
                     is_staff='FALSE',
                     is_active=status,
                     first_name=first_name,
                     last_name=last_name,
                     email=email,
                     date_joined='2015-05-22 12:54:43.001975-04:30',
                 )
                reg_obj.save()

                # Se captura id del grupo asociado a los fiscales y el id del nuevo fiscal registrado en usuario
                #id_group = Group.objects.filter(name='sistematizador')[0].id
                id_user = User.objects.filter(email = email)[0].id
                cursor = connection.cursor()
                for list_group in grupo:
                    # print "LISTA DE ID GRUPO: ",list_group
                    cursor.execute("INSERT INTO auth_user_groups(user_id, group_id) VALUES ("+str(id_user)+", "+str(list_group)+")")
                    # print "id",id_user
                    # print "ins",institucion
                cursor.execute("INSERT INTO trabajadores_trabajadores(trabajador_id, institucion_id) VALUES ("+str(id_user)+", "+str(institucion)+")")
                return HttpResponse('exito')

        elif accion == "editar":
            pk = self.request.POST.get('valor')
            grupo = self.request.POST.getlist('grupo')

            if str(self.request.POST.get('is_active')) == '1':
                status = True
                # print "PASO POR 1"
            else:
                status = False
                # print "PASO POR 2"
            # Query de actualizacion
            query = User.objects.all()
            obj = query.filter(id=pk)

            obj.update(
                username=username,
                password=password,
                last_login='2015-05-22 12:54:43.001975-04:30',
                is_superuser='TRUE',
                is_staff=False,
                is_active=status,
                first_name=first_name,
                last_name=last_name,
                email=email,
                date_joined='2015-05-22 12:54:43.001975-04:30',
            )
            id_user = User.objects.filter(email = email)[0].id
            print "id",id_user
            print "ins",institucion
            Trabajadores.objects.filter(trabajador_id=id_user).update(
                institucion_id=institucion,
            )
            cursor = connection.cursor()
            # Segmento para verificar que los grupos relacionados al usuario estén dentro de la lista enviada
            cursor.execute("SELECT group_id FROM auth_user_groups WHERE user_id="+str(id_user))
            for g in cursor.fetchall():
                print g[0]
                if g[0] in grupo:
                    pass
                else:
                    cursor.execute("DELETE FROM auth_user_groups WHERE user_id="+str(id_user)+" AND  group_id="+str(g[0])+"")
            # Segmento para verificar que los grupos enviados coinciden con los relacionados al usuario en base de datos.
            for list_group in grupo:

                #print "LISTA DE ID GRUPO: ",list_group
                cursor.execute("SELECT COUNT(*) FROM auth_user_groups WHERE user_id="+str(id_user)+" AND  group_id="+str(list_group)+"")
                num_group = cursor.fetchone()[0]
                #print num_group

                if num_group == 0:
                    cursor.execute("INSERT INTO auth_user_groups(user_id, group_id) VALUES ("+str(id_user)+", "+str(list_group)+")")

            return HttpResponse('actualizar')

        return HttpResponseRedirect('/nuevo_usuario')

    def get_context_data(self, **kwargs):

        cursor = connection.cursor()
        cursor.execute("SELECT a.id, a.email, a.username, a.first_name, a.last_name, a.is_active, array_to_string(array_agg(c.name), ', ') AS name FROM auth_user a  INNER JOIN auth_user_groups au ON au.user_id = a.id  INNER JOIN auth_group c ON c.id = au.group_id GROUP BY a.id, a.email, a.username, a.first_name, a.last_name")
        data = cursor.fetchall()
        # print "LISTA: ",data
        context = {
            'listar_usuarios': data,
            'grupo': Group.objects.all().order_by('id'),
            'listar_institucion': Institucion.objects.all()
            }
        return context


def buscar_grupos(request):
    """ metodo que cierra la sesion y redirecciona al usuario a la pagina de inicio.
    """
    id_user = request.GET['id_user']

    cursor = connection.cursor()

    cursor.execute("SELECT group_id FROM auth_user_groups WHERE user_id="+str(id_user))

    lista_grupos = []
    for grupo in cursor.fetchall():
        lista_grupos_esp = []
        nom_grupo = Group.objects.get(id=grupo[0]).name
        lista_grupos_esp.append(grupo[0])
        lista_grupos_esp.append(str(nom_grupo))
        lista_grupos.append(lista_grupos_esp)

    data = json.dumps(lista_grupos)  # Se realiza un dumps de la lista de parroquias
    return HttpResponse(data, content_type='application/json')  # Se retorna con formato json


def buscar_institucion(request):
    """ metodo que cierra la sesion y redirecciona al usuario a la pagina de inicio.
    """
    id_user = request.GET['id_user']
    cursor = connection.cursor()
    cursor.execute("SELECT institucion_id FROM trabajadores_trabajadores WHERE trabajador_id="+str(id_user))
    print "hola"
    lista_institucion = []
    for inst in cursor.fetchall():
        lista_institucion_esp = []
        # print "1111",inst[0]
        nom_inst = Institucion.objects.get(id=inst[0]).nom_institucion
        # print "222",nom_inst
        lista_institucion_esp.append(inst[0])
        lista_institucion_esp.append(str(nom_inst))
        lista_institucion.append(lista_institucion_esp)
    # print lista_institucion
    data = json.dumps(lista_institucion)  # Se realiza un dumps de la lista de parroquias
    return HttpResponse(data, content_type='application/json')  # Se retorna con formato json



def logout_view(request):
    """ metodo que cierra la sesion y redirecciona al usuario a la pagina de inicio.
    """
    logout(request)
    return HttpResponseRedirect('/')
