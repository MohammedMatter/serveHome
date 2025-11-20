// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:serve_home/core/helpers/screen_size.dart';

class ResponsiveConfig {
  final double titleFontSize;
  final double countFontSize;
  final double horizontalPadding;
  final double verticalPadding;
  final double iconSize;
  final double? imageSize;
  final int? crossAxisCount;
  final double? buttonSize;
  ResponsiveConfig({
    required this.crossAxisCount,
    required this.titleFontSize,
    required this.countFontSize,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.iconSize,
    required this.imageSize,
    required this.buttonSize,
  });
  factory ResponsiveConfig.fromConstraints(
    BoxConstraints constraints,
    BuildContext context,
    int? crossAxixCount,
  ) {
    if (constraints.maxWidth > 1200) {
      return ResponsiveConfig(
        imageSize: ScreenSize.w(context) * 0.075,
        crossAxisCount: 4,
        titleFontSize: ScreenSize.w(context) * 0.0078,
        countFontSize: ScreenSize.w(context) * 0.012,
        horizontalPadding: ScreenSize.w(context) * 0.018,
        verticalPadding: ScreenSize.h(context) * 0.006,
        iconSize: ScreenSize.h(context) * 0.023,
        buttonSize: ScreenSize.w(context) * 0.015,
      );
    } else if (constraints.maxWidth > 800) {
      return ResponsiveConfig(
        imageSize: ScreenSize.w(context) * 0.13,
        crossAxisCount: 2,
        titleFontSize: ScreenSize.w(context) * 0.018,
        countFontSize: ScreenSize.w(context) * 0.02,
        horizontalPadding: ScreenSize.w(context) * 0.03,
        verticalPadding: ScreenSize.h(context) * 0.010,
        iconSize: ScreenSize.h(context) * 0.021,
        buttonSize: ScreenSize.w(context) * 0.03,
      );
    } else {
      return ResponsiveConfig(
        imageSize: ScreenSize.w(context) * 0.27,
        crossAxisCount: 1,
        titleFontSize: ScreenSize.w(context) * 0.025,
        countFontSize: ScreenSize.w(context) * 0.03,
        horizontalPadding: ScreenSize.w(context) * 0.03,
        verticalPadding: ScreenSize.h(context) * 0.010,
        iconSize: ScreenSize.h(context) * 0.030,
        buttonSize: ScreenSize.w(context) * 0.1,
      );
    }
  }
}
