import 'package:flutter/material.dart';
import '../models/image_model.dart';
import 'image_utils.dart';
import 'text_styles.dart';

class DownloadButton extends StatelessWidget {
  final ImageModel image;

  const DownloadButton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        bool success = await ImageUtils.downloadAndSaveImage(image.imageUrl);
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Image downloaded successfully',
                style: TextStyles.successMsg,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Failed to download image', style: TextStyles.errorMsg),
            ),
          );
        }
      },
      child: const Icon(Icons.file_download),
    );
  }
}
