
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/features/services/presentation/view_models/service_view_model.dart';

class SearchWidget extends StatelessWidget {
  TextEditingController search ; 
   SearchWidget({
    required this.search , 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceViewModel>(
      builder: (context, provService, child) =>  SizedBox(
        height: 45,
        child: TextField(
          onChanged: (value) {
         provService.changeSearchtext(value) ; 
         
          },
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
            fillColor: const Color.fromARGB(171, 219, 223, 226),
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
      ),
    );
  }
}
