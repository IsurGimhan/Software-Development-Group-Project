from django.http import JsonResponse
import requests
from django.views.decorators.csrf import csrf_exempt
from requests.exceptions import RequestException

@csrf_exempt
def upload_image(request):
    if request.method == 'POST' and request.FILES.get('image'):
        image = request.FILES['image']
        ml_url = 'http://127.0.0.1:8080/modelendPoint/identify_image/'
        try:
            response = requests.post(ml_url, files={'image': image})
            response.raise_for_status()  # Raise an exception for bad status codes
            ml_result = response.text.strip('"')
            return JsonResponse(ml_result, safe=False)
        except RequestException as e:
            return JsonResponse({'error': str(e)}, status=500)  # Return error message as JSON
    return JsonResponse({'error': 'Invalid request'}, status=400)
