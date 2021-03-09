from django.http import HttpResponse

from .models import PageRefresh


def count(request):
    PageRefresh.objects.create()
    return HttpResponse(f'This page was refreshed {PageRefresh.objects.create().id} times.')
