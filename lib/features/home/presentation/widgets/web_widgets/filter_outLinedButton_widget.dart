import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';

class FilterOutLinedButtonWidget extends StatelessWidget {
  const FilterOutLinedButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          AppColor.primary,
        ),
        side: WidgetStatePropertyAll(
          BorderSide(width: 0.18),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
      ),
      onPressed: () {},
      label: Text('Filter by date'),
      icon: Icon(Icons.filter_alt_outlined),
    );
  }
}
