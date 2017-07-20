from django.db import models

class Ocupaciones(models.Model):
    
    ocupacion = models.CharField(max_length=120,)
