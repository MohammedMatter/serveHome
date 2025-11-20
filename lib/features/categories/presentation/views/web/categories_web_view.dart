import 'package:flutter/material.dart';
import 'package:serve_home/features/home/presentation/widgets/web_widgets/drawer_widget.dart';

class CategoriesWebView extends StatelessWidget {
  const CategoriesWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Row(children: [
        DrawerWidget(),
        Text('data')
    ],),);
  }
}