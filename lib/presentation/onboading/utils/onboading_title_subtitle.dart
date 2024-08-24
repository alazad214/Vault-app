import 'package:flutter/material.dart';
import 'package:vault_app/utils/color.dart';

class OnboadingTitleSubtitle extends StatelessWidget {
  const OnboadingTitleSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'Easily Access, Fully Secure.',
          style: TextStyle(
              color: AppColor.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          textAlign: TextAlign.center,
          'Quickly retrieve your secured files and information with a simple tap.',
          style: TextStyle(
            color: AppColor.white.withOpacity(0.5),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
