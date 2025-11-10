import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/styles/app_style.dart';

// ignore: must_be_immutable
class CusstomBookWidget extends StatelessWidget {
  CusstomBookWidget({required this.indexScreen, super.key});
  int indexScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 30),
          child: Column(
            children: [
              Row(
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
                        'Book Service',
                        style: AppStyle.body19.copyWith(color: Colors.black),
                      ),
                      Text(
                        'House Cleaning',
                        style: AppStyle.subTitle.copyWith(
                          color: AppColor.primary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.primary,
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 60,
                      child: Divider(
                        color:
                            indexScreen == 0
                                ? const Color.fromARGB(57, 163, 160, 160)
                                : AppColor.primary,
                        thickness: 3.5,
                      ),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      backgroundColor:
                          indexScreen == 0
                              ? const Color.fromARGB(57, 163, 160, 160)
                              : AppColor.primary,
                      child: Text(
                        '2',
                        style: TextStyle(
                          color:
                              indexScreen == 0
                                  ? const Color.fromARGB(255, 141, 140, 140)
                                  : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 60,
                      child: Divider(
                        color:
                            indexScreen == 0 || indexScreen == 1
                                ? const Color.fromARGB(57, 163, 160, 160)
                                : AppColor.primary,
                        thickness: 3.5,
                      ),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      backgroundColor:
                          indexScreen == 0 || indexScreen == 1
                              ? const Color.fromARGB(57, 163, 160, 160)
                              : AppColor.primary,
                      child: Text(
                        '3',
                        style: TextStyle(
                          color:
                              indexScreen == 0 || indexScreen == 1
                                  ? const Color.fromARGB(255, 141, 140, 140)
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: const Color.fromARGB(57, 163, 160, 160),

          thickness: 0.38,
        ),
      ],
    );
  }
}
