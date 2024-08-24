import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vault_app/presentation/calculator/views/calculator_screen.dart';
import 'package:vault_app/utils/app_config.dart';
import 'package:vault_app/utils/app_image.dart';
import 'package:vault_app/utils/color.dart';
import 'package:vault_app/utils/string.dart';
import 'package:vault_app/widgets/button1.dart';

class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 30.0),
        child: ListView(
          children: [
            Container(
              height: screenSize.height / 5,
              child: Image.asset(
                AppImage.calculatorlock,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              'Easily Access, Fully Secure.',
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              textAlign: TextAlign.center,
              'Quickly retrieve your secured files and information with a simple tap.',
              style: TextStyle(
                color: AppColor.white.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            Container(
              height: screenSize.height / 2.5,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
              margin:
                  EdgeInsets.only(top: 20.0, left: 15, right: 15, bottom: 15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColor.white.withOpacity(0.1)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Privacy & Permissions Notice!',
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: AppColor.secondary,
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      AppString.privacyAndPermissions,
                      style: TextStyle(
                        color: AppColor.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
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
            ),
            Button1(
              text: 'Agree & Continue',
              ontap: () {
                Get.offAll(() => CalculatorScreen());
                Fluttertoast.showToast(
                    msg:
                        'You are aware of all permissions and privacy policies of this app');
              },
            ),
            Button1(
              text: 'Disagree',
              bgcolor: Colors.transparent,
              color: AppColor.white2,
              ontap: () {
                Get.defaultDialog(
                    backgroundColor: AppColor.primary,
                    title:
                        'If Desagree, you will not use to ${AppConfig.appName}',
                    titleStyle: TextStyle(color: Colors.yellow, fontSize: 18.0),
                    content: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 5.0),
                          child: RichText(
                            text: TextSpan(
                                text:
                                    "By Continuing To Use  ${AppConfig.appName} . You agree to our  ",
                                children: [
                                  TextSpan(
                                      text: 'Privacy Policy ',
                                      style:
                                          TextStyle(color: AppColor.secondary)),
                                  TextSpan(text: 'And  '),
                                  TextSpan(
                                      text: 'Permissions.',
                                      style:
                                          TextStyle(color: AppColor.secondary)),
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
            ),
          ],
        ),
      ),
    );
  }
}
