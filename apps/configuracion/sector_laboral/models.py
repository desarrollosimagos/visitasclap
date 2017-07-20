from django.db import models

class SectorLaboral(models.Model):
    
    sector = models.CharField(max_length=60,)
