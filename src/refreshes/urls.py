from django.urls import path

from . import views

app_name = 'refreshes'

urlpatterns = [
    path('', views.count, name='count')
]
