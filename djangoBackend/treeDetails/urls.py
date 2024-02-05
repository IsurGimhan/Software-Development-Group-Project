# yourappname/urls.py
from django.urls import path
from .views import get_wikipedia_details

urlpatterns = [
    path('wikipedia/<str:title>/', get_wikipedia_details),
]
