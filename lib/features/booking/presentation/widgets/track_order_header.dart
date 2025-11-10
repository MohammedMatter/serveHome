
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';

class TrackOrderHeader extends StatelessWidget {
  const TrackOrderHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                elevation: WidgetStatePropertyAll(0),
                iconSize: WidgetStatePropertyAll(25),
                shape: WidgetStatePropertyAll(CircleBorder()),
                backgroundColor: WidgetStatePropertyAll(
                  Color(0xfff3f4f6),
                ),
              ),
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Track Order',
                style: AppStyle.body19.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                'Order #SH-59262',
                style: AppStyle.subTitle.copyWith(
                  color: AppColor.primary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
