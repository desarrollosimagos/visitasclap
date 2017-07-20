"""
Django settings for control_visitas project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

RUTA_TEMPLATES = os.path.join(BASE_DIR, 'templates')

RUTA_STATIC = os.path.join(BASE_DIR, 'static')

STATICFILES_DIRS = (RUTA_STATIC,)

TEMPLATE_DIRS = (RUTA_TEMPLATES,)

MEDIA_ROOT = os.path.join(BASE_DIR, 'imagenes')
MEDIA_URL = '/imagenes/'

MEDIA_PDF = os.path.join(BASE_DIR, 'reporte')
REPORTE = '/reporte/'
# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'dj0*qo1q&&x17w$g-%ihf^68mn6ar)tn0pz4^(2$t**lg1(1oi'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = ['*']



# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'apps.login',
    'apps.menu',
    'apps.topologia.estados',
    'apps.topologia.municipios',
    'apps.topologia.parroquias',
    'apps.configuracion.tipo_educacion',
    'apps.configuracion.instituciones',
    'apps.configuracion.dependencias',
    'apps.configuracion.sector_laboral',
    'apps.configuracion.motivo',
    'apps.configuracion.ocupacion',
    'apps.configuracion.organizacion_social',
    'apps.configuracion.grupo_etareo',
    'apps.configuracion.trabajadores',
    'apps.registro.solicitud',

)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'visitasclap.urls'

WSGI_APPLICATION = 'visitasclap.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'visitas_claps',
        'USER': 'visitaclap',
        'PASSWORD': 'v151t@s2016',
        'HOST': '127.0.0.1',
        'PORT': '5432',

    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'es-ar'

TIME_ZONE = 'America/Caracas'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/
STATIC_ROOT = '/home/administrador/django/visitasclap/static/'
#STATIC_URL ='http://panel.bva.org.ve/control/static/'

STATIC_URL = '/static/'

