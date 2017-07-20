# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Grupo_Etareo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('descripcion', models.CharField(max_length=20, unique=True, null=True, verbose_name=b'Descripci\xc3\xb3n')),
                ('desde', models.CharField(max_length=2, null=True, verbose_name=b'Desde', blank=True)),
                ('hasta', models.CharField(max_length=2, null=True, verbose_name=b'Hasta', blank=True)),
                ('fecha_create', models.DateTimeField(auto_now_add=True)),
                ('fecha_update', models.DateTimeField(auto_now=True, null=True)),
                ('user_create', models.ForeignKey(related_name='+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('user_update', models.ForeignKey(related_name='+', blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'ordering': ('descripcion',),
            },
            bases=(models.Model,),
        ),
    ]
