import 'package:flutter/material.dart';
import 'package:serve_home/core/styles/app_style.dart';

class ServiceInclusionsWidget extends StatelessWidget {
  const ServiceInclusionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'What\'s included',
            style: AppStyle.body19,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 19),
                  SizedBox(width: 15),
                  Text('Professional equipment and supplies'),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 19),
                  SizedBox(width: 15),
                  Text('Background-checked professionals'),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 19),
                  SizedBox(width: 15),
                  Text('100% satisfaction guarantee'),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 19),
                  SizedBox(width: 15),
                  Text('Free rescheduling if needed'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
