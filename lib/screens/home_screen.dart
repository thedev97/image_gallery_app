import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/text_styles.dart';
import '../view_models/image_viewmodel.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ImageViewModel>(context, listen: false).fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery',
            style: TextStyles.title),
      ),
      body: Consumer<ImageViewModel>(
        builder: (context, model, child) {
          if (model.images.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: model.images.length,
            itemBuilder: (context, index) {
              final image = model.images[index];
              return ListTile(
                title: Text(image.description, style: TextStyles.description,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(image: image),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
