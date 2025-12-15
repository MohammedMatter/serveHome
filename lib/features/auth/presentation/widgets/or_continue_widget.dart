
import 'package:flutter/material.dart';

class OrContinueWidget extends StatelessWidget {
  const OrContinueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 45, child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text('or continue with'),
        ),
        SizedBox(width: 45, child: Divider()),
      ],
    );
  }
}
