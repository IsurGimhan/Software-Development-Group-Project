from django.test import TestCase, Client
from django.urls import reverse
from unittest.mock import patch
from django.core.files.uploadedfile import SimpleUploadedFile
from django.http import JsonResponse

class UploadImageViewTestCase(TestCase):
    def setUp(self):
        self.client = Client()

    @patch('requests.post')
    def test_upload_image_success(self, mock_post):
        mock_post.return_value.text = '"result"'
        with open('sampleTestImg.jpeg', 'rb') as image_file:
            response = self.client.post(reverse('upload_image'), {'image': SimpleUploadedFile('test_image.jpg', image_file.read())})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), 'result')



    @patch('requests.post')
    def test_upload_image_failure(self, mock_post):
        mock_post.side_effect = Exception('Mocked error')
        with open('path_to_your_image_file', 'rb') as image_file:
            response = self.client.post(reverse('upload_image'), {'image': SimpleUploadedFile('test_image.jpg', image_file.read())})
        self.assertEqual(response.status_code, 500)
        self.assertIn('error', response.content.decode())
