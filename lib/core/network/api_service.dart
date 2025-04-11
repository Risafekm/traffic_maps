// core/api/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.data.gov.sg/v1/transport';

  Future<List<dynamic>> getTrafficCameras() async {
    final url = Uri.parse('$_baseUrl/traffic-images');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['items'][0]['cameras'] as List<dynamic>;
    } else {
      throw Exception('Failed to load traffic camera data');
    }
  }
}
