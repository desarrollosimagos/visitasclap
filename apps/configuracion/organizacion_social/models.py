from django.db import models

class Organizaciones(models.Model):
    
    organizacion = models.CharField(max_length=60,)
