from django.db import models


class PageRefresh(models.Model):
    def __repr__(self):
        return f'{self.id}'
