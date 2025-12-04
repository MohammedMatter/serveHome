import 'package:flutter/material.dart';
import 'package:serve_home/features/booking/data/models/book_model.dart';

class BookingImageWidget extends StatelessWidget {
  BookModel book;
  BookingImageWidget({required this.book});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Image.network(
          book.imageUrl,
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) => Image.asset(
                fit: BoxFit.fill,
                'assets/images/placeholderImage/placeholder.png',
              ),
        ),
      ),
    );
  }
}
