import 'package:flutter/material.dart';

class ImageServiceWidget extends StatelessWidget {
  double imageSize ; 
  String imageUrl;
  ImageServiceWidget({required this.imageUrl, super.key , required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
          bottom: Radius.circular(12),
        ),
      ),
      height: imageSize,
      width: double.infinity,

      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
          bottom: Radius.circular(12),
        ),
        child: Image.network(imageUrl, fit: BoxFit.fill),
      ),
    );
  }
}
