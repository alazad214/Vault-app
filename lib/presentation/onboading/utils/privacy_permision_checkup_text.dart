import 'package:flutter/material.dart';
import 'package:vault_app/utils/app_config.dart';
import 'package:vault_app/utils/color.dart';

class PrivacyPermisionCheckupText extends StatelessWidget {
  const PrivacyPermisionCheckupText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25.0),
      child: RichText(
        text: TextSpan(
            text:
                "By Continuing To Use  ${AppConfig.appName} . You agree to our  ",
            children: [
              TextSpan(
                  text: 'Privacy Policy ',
                  style: TextStyle(color: AppColor.secondary)),
              TextSpan(text: 'And  '),
              TextSpan(
                  text: 'Permissions.',
                  style: TextStyle(color: AppColor.secondary)),
            ]),
      ),
    );
  }
}
