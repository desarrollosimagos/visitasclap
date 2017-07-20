from django.db import models

class Motivos(models.Model):
    
    motivo = models.CharField(max_length=60,)
