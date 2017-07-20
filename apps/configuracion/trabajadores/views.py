from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from .models import Motivos
from .forms import MotivosForm
from django.http import HttpResponse, HttpResponseRedirect
