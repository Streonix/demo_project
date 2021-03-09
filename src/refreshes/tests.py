import re

from django.test import TestCase, Client
from django.urls import reverse


class TestResultModel(TestCase):
    def test_counter_increase_by_one_after_requesting_the_page(self):
        client = Client()
        response = client.get(reverse('refreshes:count'))
        previous_number = int(re.findall('This page was refreshed (\\d+) times', response.content.decode('utf-8'))[0])
        response = client.get(reverse('refreshes:count'))
        second_number = int(re.findall('This page was refreshed (\\d+) times', response.content.decode('utf-8'))[0])
        self.assertEqual(second_number, previous_number + 2)
