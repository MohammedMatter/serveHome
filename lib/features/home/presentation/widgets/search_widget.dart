
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        cursorColor: AppColor.primary,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search for a service...',
          contentPadding: EdgeInsets.only(
            bottom: 10,
            left: 10,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: const Color.fromARGB(
            171,
            189,
            195,
            201,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
