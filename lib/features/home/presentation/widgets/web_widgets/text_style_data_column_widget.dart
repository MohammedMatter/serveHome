import 'package:flutter/material.dart';
import 'package:serve_home/core/styles/app_style.dart';

class TextStyleDataColumnWidget extends StatelessWidget {
   TextStyleDataColumnWidget({
    required this.txt , 
    super.key,
  });
String  txt ; 
  @override
  Widget build(BuildContext context) {
    return Text(
     txt,
      style: AppStyle.body15(context).copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
