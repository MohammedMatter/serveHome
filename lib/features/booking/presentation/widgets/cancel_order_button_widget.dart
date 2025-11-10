
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_home/core/router/app_router.dart';

class CancelOrderButtonWidget extends StatelessWidget {
  const CancelOrderButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            GoRouter.of(context).pushReplacementNamed(AppRouter.homeView) ; 
          },
          child: Text('Cancel Order'),
          style: ButtonStyle(
          
            side: WidgetStatePropertyAll(
              
              BorderSide(color: Colors.red, width: 1.5),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            foregroundColor: WidgetStatePropertyAll(Colors.red),
            overlayColor: WidgetStatePropertyAll(Colors.red.shade100)
          ),
        ),
      ),
    );
  }
}
