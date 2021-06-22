import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewImageScreen extends StatelessWidget {
  static const routeName = '/image-view';

  const ViewImageScreen({this.image});
  final ImageProvider<Object>? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      body: Hero(
        tag: 'image',
        child: PhotoView(
          imageProvider: image,
        ),
      ),
    );
  }
}
