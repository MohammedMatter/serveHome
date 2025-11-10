import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/helpers/screen_size.dart';
import 'package:serve_home/core/router/app_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:serve_home/features/booking/presentation/widgets/custom_book_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/select_date_widget.dart';
import 'package:serve_home/features/booking/presentation/widgets/select_time_widget.dart';
import 'package:serve_home/features/services/presentation/widgets/bottom_navigation_bar_details_widget.dart';

class FitstBookView extends StatelessWidget {
  const FitstBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager,
    );
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarDetailsWidget(
        label: 'Continue',
        icon: null,
        navigationToAnotherScreen: () {
          GoRouter.of(context).pushNamed(AppRouter.secondBookView);
        },
      ),
      body: BookStep1Widget(dateFormatter: dateFormatter),
    );
  }
}

class BookStep1Widget extends StatelessWidget {
  const BookStep1Widget({super.key, required this.dateFormatter});

  final MaskTextInputFormatter dateFormatter;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),

        child: Container(
          height: ScreenSize.h(context) * 0.9,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CusstomBookWidget(indexScreen: 0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      SelectDateWidget(dateFormatter: dateFormatter),
                      SizedBox(height: 15),
                      SelectTimeWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
