# yourappname/urls.py
from django.urls import path
from .views import get_tree_details

urlpatterns = [
    path('<str:title>/', get_tree_details),
]
