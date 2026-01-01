import 'package:flutter/material.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/booking/data/models/book_model.dart';

// ignore: must_be_immutable
class BookingImageWidget extends StatelessWidget {
  BookModel book;
  BookingImageWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final double imageHeight = (ScreenSize.h(context) * 0.25).clamp(180, 300);
    final double borderRadius = (ScreenSize.w(context) * 0.05).clamp(15, 25); 

    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
      child: SizedBox(
        height: imageHeight,
        width: double.infinity,
        child: Image.network(
          book.imageUrl,
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
