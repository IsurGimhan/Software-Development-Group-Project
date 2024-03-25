from django.test import TestCase, Client
from django.core.files.uploadedfile import SimpleUploadedFile
from unittest.mock import patch

class UploadImageViewTestCase(TestCase):
    def setUp(self):
        self.client = Client()

    @patch('requests.post')
    def test_upload_image_success(self, mock_post):
        # Mock the post method to return a successful response
        mock_post.return_value.status_code = 200
        mock_post.return_value.text = '"mocked_result"'

        # Create a dummy image file
        image_data = b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x01\x00\x00\x00\x01\x08\x06\x00\x00\x00\x1f\x15\xc4\x89\x00\x00\x00\rIDAT\x08\xd7c\xfc\xff\xff\x03\x00\x05\x00\x01\r\n\x0b\xfc\x00\x00\x00\x00IEND\xaeB`\x82'
        image_file = SimpleUploadedFile('test_image.png', image_data, content_type='image/png')

        # Make a POST request to the view
        response = self.client.post('/TreeIdentification/upload_image/', {'image': image_file})

        # Check if the response is successful (HTTP 200 OK)
        self.assertEqual(response.status_code, 200)

        # Check if JSON response contains expected keys or values
        self.assertIn('mocked_result', response.json())

    def test_upload_image_failure(self):
        # Make a GET request to the view (which is an invalid request)
        response = self.client.get('/TreeIdentification/upload_image/')

        # Check if the response status code is 400 (Bad Request)
        self.assertEqual(response.status_code, 400)

        # Check if JSON response contains expected error message
        self.assertIn('error', response.json())
