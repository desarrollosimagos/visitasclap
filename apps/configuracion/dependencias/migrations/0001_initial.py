# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('instituciones', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Dependencia',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nom_dependencia', models.CharField(max_length=125)),
                ('siglas', models.CharField(max_length=15)),
                ('correo', models.CharField(max_length=100, null=True)),
                ('dependencia_activa', models.BooleanField(default=False)),
                ('fecha_create', models.DateTimeField(auto_now_add=True)),
                ('fecha_update', models.DateTimeField(auto_now=True, null=True)),
                ('institucion', models.ForeignKey(to='instituciones.Institucion')),
                ('user_create', models.ForeignKey(related_name='+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('user_update', models.ForeignKey(related_name='+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'ordering': ('institucion', 'nom_dependencia'),
            },
            bases=(models.Model,),
        ),
    ]
