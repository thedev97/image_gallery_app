import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageUtils {
  static Future<bool> downloadAndSaveImage(String imageUrl) async {
    try {
      final ByteData data = await NetworkAssetBundle(Uri.parse(imageUrl)).load('');
      final Uint8List bytes = data.buffer.asUint8List();
      final result = await ImageGallerySaver.saveImage(Uint8List.fromList(bytes));
      return result != null && result.isNotEmpty;
    } catch (e) {
      print('Error during image download and save: $e');
      return false;
    }
  }
}