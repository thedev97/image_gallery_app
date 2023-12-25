import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/image_model.dart';

class ImageProvider extends ChangeNotifier {
  List<ImageModel> _images = [];

  List<ImageModel> get images => _images;

  Future<void> fetchImages() async {
    final response = await http.get(
      Uri.parse('https://api.unsplash.com/photos/'),
      headers: {
        'Authorization': 'Client-ID 8fZZLAtYG6LkkNbNsa7-_35CESYO-62CM5zQfc_-Nas',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _images = data.map((item) => ImageModel(
        id: item['id'],
        description: item['description'] ?? '',
        imageUrl: item['urls']['regular'],
        likes: item['likes'],
      )).toList();

      notifyListeners();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
