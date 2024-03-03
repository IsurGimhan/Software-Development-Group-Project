# yourappname/views.py
from django.http import JsonResponse
import requests

def get_tree_details(request, title):
    wikipedia_api_url = f"https://en.wikipedia.org/w/api.php?action=query&format=json&titles={title}&prop=extracts&exintro&explaintext"
    
    response = requests.get(wikipedia_api_url)
    data = response.json()

    page_id = next(iter(data['query']['pages']))
    page_details = data['query']['pages'][page_id]

    # Custom formatting of the response
    formatted_response = {
        "title": page_details['title'],
        "description": page_details['extract']
    }

    return JsonResponse(formatted_response)
