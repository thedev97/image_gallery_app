import 'package:flutter/material.dart';
import '../models/image_model.dart';
import '../utils/download_button.dart';
import '../utils/text_styles.dart';

class DetailScreen extends StatelessWidget {
  final ImageModel image;

  const DetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Image Details', style: TextStyles.title,),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(image.imageUrl, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description: ${image.description}',
                    style: TextStyles.description,
                  ),
                  const SizedBox(height: 8),
                  Text('Likes: ${image.likes}', style: TextStyles.likes),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: DownloadButton(image: image),
    );
  }
}
