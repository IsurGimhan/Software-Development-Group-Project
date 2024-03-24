# from django.test import TestCase, Client
# from django.core.files.uploadedfile import SimpleUploadedFile
# from requests import RequestException
# import requests_mock

# class UploadImageTestCase(TestCase):
#     def setUp(self):
#         self.client = Client()

#     def test_upload_image_success(self):
#         # Create a mock image file
#         image_data = b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x05\x00\x00\x00\x05\x08\x06\x00\x00\x00\x8d\x8f\xee\x98\x00\x00\x00\x19tEXtSoftware\x00www.inkscape.org\x9dE<\x1a\x00\x00\x00\x0eIDATx^\xed\x96\xbf\tTQ\xc7\xbf\x07\xc8\x17\x93$\x00\x01\x03\x01\x01\x11\x00\xa8\xaa\xa8\x07\x00\x00\x00\x00IEND\xaeB`\x82'
#         image = SimpleUploadedFile("test_image.png", image_data, content_type="image/png")

#         # Make a POST request to the view
#         response = self.client.post('/upload_image/', {'image': image}, format='multipart')

#         # Check if the response status code is 200
#         self.assertEqual(response.status_code, 200)

#         # Check if the response contains the expected JSON data
#         self.assertEqual(response.json(), "result_from_ml_model")

#     def test_upload_image_invalid_request(self):
#         # Make a GET request to the view (which is invalid)
#         response = self.client.get('/upload_image/')

#         # Check if the response status code is 400
#         self.assertEqual(response.status_code, 400)

#         # Check if the response contains the expected error message
#         self.assertEqual(response.json(), {'error': 'Invalid request'})

#     def test_upload_image_ml_error(self):
#         # Create a mock image file
#         image_data = b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x05\x00\x00\x00\x05\x08\x06\x00\x00\x00\x8d\x8f\xee\x98\x00\x00\x00\x19tEXtSoftware\x00www.inkscape.org\x9dE<\x1a\x00\x00\x00\x0eIDATx^\xed\x96\xbf\tTQ\xc7\xbf\x07\xc8\x17\x93$\x00\x01\x03\x01\x01\x11\x00\xa8\xaa\xa8\x07\x00\x00\x00\x00IEND\xaeB`\x82'
#         image = SimpleUploadedFile("test_image.png", image_data, content_type="image/png")

#         # Mock the ML model endpoint to return an error
#         with requests_mock.mock() as mock_request:
#             mock_request.post('http://127.0.0.1:8080/modelendPoint/identify_image/', exc=RequestException)

#             # Make a POST request to the view
#             response = self.client.post('/upload_image/', {'image': image}, format='multipart')

#         # Check if the response status code is 500
#         self.assertEqual(response.status_code, 500)

#         # Check if the response contains the expected error message
#         self.assertIn('error', response.json())

