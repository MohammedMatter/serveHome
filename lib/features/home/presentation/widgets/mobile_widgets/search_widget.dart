import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

// ignore: must_be_immutable
class SearchWidget extends StatelessWidget {
  TextEditingController search;

  SearchWidget({
    required this.search,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = (ScreenSize.h(context) * 0.06).clamp(40, 60);
    final double horizontalPadding = (ScreenSize.w(context) * 0.03).clamp(10, 15);
    final double iconSize = (ScreenSize.w(context) * 0.06).clamp(20, 28);
    final double fontSize = (ScreenSize.w(context) * 0.035).clamp(14, 18);

    return Consumer<ServiceViewModel>(
      builder: (context, provService, child) => SizedBox(
        height: height,
        child: TextField(
          onChanged: (value) {
            provService.changeSearchtext(value);
          },
          cursorColor: AppColor.primary,
          style: TextStyle(fontSize: fontSize),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, size: iconSize),
            hintText: 'Search for a service...',
            contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: height * 0.15,
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: const Color.fromARGB(171, 219, 223, 226),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(height * 0.22),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(height * 0.22),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
