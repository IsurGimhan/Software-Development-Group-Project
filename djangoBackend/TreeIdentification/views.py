from django.http import JsonResponse
import requests
from django.views.decorators.csrf import csrf_exempt
from requests.exceptions import RequestException

@csrf_exempt
def upload_image(request):
    if request.method == 'POST' and request.FILES.get('image'):
        image = request.FILES['image']
        ml_url = 'http://127.0.0.1:5000/identify_image'
        try:
            response = requests.post(ml_url, files={'image': image})
            response.raise_for_status()  # Raise an exception for bad status codes
            ml_result = response.json()
            predict_class = ml_result.get('predict class')
            return JsonResponse(predict_class, safe=False)
        except RequestException as e:
            return JsonResponse({'error': str(e)}, status=500)  # Return error message as JSON
    return JsonResponse({'error': 'Invalid request'}, status=400)
