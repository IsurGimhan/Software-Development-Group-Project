# yourappname/views.py
from django.http import JsonResponse
import requests

def get_tree_details(request, title, circumference):
    wikipedia_api_url = f"https://en.wikipedia.org/w/api.php?action=query&format=json&titles={title}&prop=extracts&exintro&explaintext"
    
    response = requests.get(wikipedia_api_url)
    data = response.json()

    page_id = next(iter(data['query']['pages']))
    page_details = data['query']['pages'][page_id]

    circumference = float(circumference)
    age = round((circumference/3.14),2)

    # Custom formatting of the response
    formatted_response = {
        "title": page_details['title'],
        "description": page_details['extract'],
        "tree age":age
    }

    return JsonResponse(formatted_response)



