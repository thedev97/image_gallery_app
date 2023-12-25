import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://api.unsplash.com/photos/";
  final String accessKey = "8fZZLAtYG6LkkNbNsa7-_35CESYO-62CM5zQfc_-Nas";

  Future<List<Map<String, dynamic>>> fetchImages() async {
    final response = await http.get(Uri.parse('$baseUrl?client_id=$accessKey'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
