import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vault_app/presentation/calculator/views/calculator_screen.dart';
import 'package:vault_app/utils/app_config.dart';
import 'package:vault_app/widgets/button1.dart';

import '../../../utils/color.dart';

class DesagreeButton extends StatelessWidget {
  const DesagreeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button1(
      text: 'Disagree',
      bgcolor: Colors.transparent,
      color: AppColor.white2,
      ontap: () {
        Get.defaultDialog(
            backgroundColor: AppColor.primary,
            title: 'If Desagree, you will not use to ${AppConfig.appName}',
            titleStyle: TextStyle(color: Colors.yellow, fontSize: 18.0),
            content: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
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
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text(
                        'Exit',
                      )),
                  TextButton(
                      onPressed: () {
                        Get.offAll(() => CalculatorScreen());
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(color: AppColor.secondary),
                      )),
                ],
              )
            ]);
      },
    );
  }
}
