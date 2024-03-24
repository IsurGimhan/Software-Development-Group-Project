from django.test import TestCase
from django.http import HttpRequest, JsonResponse
from unittest.mock import patch, MagicMock
from .views import get_tree_details
from .models import TreeSpeciesDetail

class TreeDetailsTestCase(TestCase):
    @patch('requests.get')
    @patch('treeDetails.models.TreeSpeciesDetail.objects.get')
    def test_get_tree_details(self, mock_get, mock_requests_get):
        # Mock data for the Wikipedia API response
        wikipedia_response = {
            "query": {
                "pages": {
                    "1": {
                        "title": "Test Title",
                        "extract": "Test Description"
                    }
                }
            }
        }
        mock_requests_get.return_value.json.return_value = wikipedia_response

        # Mock data for the TreeSpeciesDetail object
        mock_tree_species = MagicMock()
        mock_tree_species.specie_growth_factor = 2.0
        mock_get.return_value = mock_tree_species

        # Create a request object
        request = HttpRequest()
        request.method = 'GET'

        # Call the view function
        response = get_tree_details(request, "Test Title", "100")

        # Check the response content
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response['Content-Type'], 'application/json')  # Check Content-Type header
        self.assertEqual(response['title'], "Test Title")
        self.assertEqual(response['description'], "Test Description")

        # Calculate expected tree age
        expected_age = round((100 / 3.14) * 2.0, 2)

        # Check if the calculated age matches the expected age
        self.assertEqual(float(response['tree age']), expected_age)

    @patch('requests.get')
    @patch('treeDetails.models.TreeSpeciesDetail.objects.get')
    def test_get_tree_details_default_growth_factor(self, mock_get, mock_requests_get):
        # Mock data for the Wikipedia API response
        wikipedia_response = {
            "query": {
                "pages": {
                    "1": {
                        "title": "Test Title",
                        "extract": "Test Description"
                    }
                }
            }
        }
        mock_requests_get.return_value.json.return_value = wikipedia_response

        # Mock behavior for when the tree species detail is not found
        mock_get.side_effect = TreeSpeciesDetail.DoesNotExist

        # Create a request object
        request = HttpRequest()
        request.method = 'GET'

        # Call the view function
        response = get_tree_details(request, "Test Title", "100")

        # Check the response content
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response['Content-Type'], 'application/json')  # Check Content-Type header
        self.assertEqual(response['title'], "Test Title")
        self.assertEqual(response['description'], "Test Description")

        # Calculate expected tree age using the default growth factor (1.0)
        expected_age = round(100 / 3.14, 2)

        # Check if the calculated age matches the expected age
        self.assertEqual(float(response['tree age']), expected_age)
