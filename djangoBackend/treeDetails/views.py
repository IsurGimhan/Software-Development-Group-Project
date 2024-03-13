# yourappname/views.py
from django.http import JsonResponse
import requests
from treeDetails.models import TreeSpeciesDetail

def get_tree_details(request, title, circumference):
    wikipedia_api_url = f"https://en.wikipedia.org/w/api.php?action=query&format=json&titles={title}&prop=extracts&exintro&explaintext"
    
    response = requests.get(wikipedia_api_url)
    data = response.json()

    page_id = next(iter(data['query']['pages']))
    page_details = data['query']['pages'][page_id]

    # try:
    #     tree_species = TreeSpeciesDetail.objects.get(specie_name=title)
    #     growth_factor = tree_species.specie_growth_factor
    # except TreeSpeciesDetail.DoesNotExist:
    #     growth_factor = 1.0  # Default growth factor if not found

    growth_factor = 1.5
    circumference = float(circumference)
    age = round((circumference/3.14),2)
    age = age * float(growth_factor)

    # Custom formatting of the response
    formatted_response = {
        "title": page_details['title'],
        "description": page_details['extract'],
        "tree age":str(round(age,2))
    }

    return JsonResponse(formatted_response)



