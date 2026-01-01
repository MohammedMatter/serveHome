import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class ImageServiceWidget extends StatelessWidget {
  final double? imageSize;
  final String imageUrl;

  const ImageServiceWidget({
    super.key,
    required this.imageUrl,
    this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    final double height = imageSize ?? (ScreenSize.h(context) * 0.25); 
    final BorderRadius borderRadius = BorderRadius.circular(12);

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, 
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/images/placeholderImage/placeholder.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
