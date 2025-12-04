import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';

// ignore: must_be_immutable
class LabeledInfoWidget extends StatelessWidget {
  String label;
  String info;
  IconData icon;
  Color? infoColor;
  LabeledInfoWidget({
    this.infoColor,
    required this.label,
    required this.info,
    required this.icon,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColor.primary, size: 18),
            SizedBox(width: 5),
            Text(label, style: AppStyle.body13),
          ],
        ),
        SizedBox(height: 5),
        Text(info, style: AppStyle.body12.copyWith(color: infoColor)),
      ],
    );
  }
}
