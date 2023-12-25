import 'package:flutter/foundation.dart';
import '../models/image_model.dart';
import '../services/api_service.dart';


class ImageViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<ImageModel> _images = [];

  List<ImageModel> get images => _images;

  Future<void> fetchImages() async {
    final List<Map<String, dynamic>> data = await _apiService.fetchImages();
    _images = data.map((e) => ImageModel(
      id: e['id'],
      description: e['alt_description'] ?? '',
      imageUrl: e['urls']['regular'],
      likes: e['likes'],
    )).toList();

    notifyListeners();
  }
}
