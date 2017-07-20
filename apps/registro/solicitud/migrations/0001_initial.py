# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('motivo', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('instituciones', '0001_initial'),
        ('estados', '0001_initial'),
        ('sector_laboral', '0001_initial'),
        ('organizacion_social', '0001_initial'),
        ('ocupacion', '0001_initial'),
        ('tipo_educacion', '0001_initial'),
        ('dependencias', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Registros',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('codigo', models.CharField(max_length=50)),
                ('fecha_sal', models.DateTimeField(null=True, blank=True)),
                ('fecha_ent', models.DateTimeField(null=True, blank=True)),
                ('cedula', models.IntegerField()),
                ('nombre', models.CharField(max_length=50)),
                ('apellido', models.CharField(max_length=50)),
                ('sexo', models.CharField(default=0, max_length=1, choices=[(b'0', b'Seleccione'), (b'1', b'Femenino'), (b'2', b'Masculino')])),
                ('edad', models.IntegerField()),
                ('telefono', models.CharField(max_length=11)),
                ('twitter', models.CharField(max_length=80, null=True, blank=True)),
                ('parroquia', models.IntegerField()),
                ('municipio', models.IntegerField()),
                ('direcc_es', models.TextField(null=True, blank=True)),
                ('descripcion', models.TextField(null=True, blank=True)),
                ('status', models.CharField(default=1, max_length=2, choices=[(b'1', b'En Proceso'), (b'2', b'Finalizada')])),
                ('codigo_centro', models.IntegerField(max_length=25, null=True, blank=True)),
                ('nombre_centro', models.CharField(max_length=150, null=True, blank=True)),
                ('departamento', models.ForeignKey(to='dependencias.Dependencia')),
                ('estado', models.ForeignKey(related_name='institucion_estado', on_delete=django.db.models.deletion.SET_NULL, to_field=b'cod_estado', to='estados.Estado', null=True)),
                ('institucion', models.ForeignKey(to='instituciones.Institucion')),
                ('motivo', models.ForeignKey(to='motivo.Motivos')),
                ('ocupacion', models.ForeignKey(to='ocupacion.Ocupaciones')),
                ('organizacion', models.ForeignKey(to='organizacion_social.Organizaciones')),
                ('sector_lab', models.ForeignKey(to='sector_laboral.SectorLaboral')),
                ('tipo_edu', models.ForeignKey(to='tipo_educacion.TipoEducacion')),
                ('user_create', models.ForeignKey(related_name='+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
