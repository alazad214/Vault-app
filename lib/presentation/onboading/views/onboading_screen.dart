import 'package:flutter/material.dart';
import 'package:vault_app/presentation/onboading/utils/agree_continue_button.dart';
import 'package:vault_app/presentation/onboading/utils/desagree_button.dart';
import 'package:vault_app/presentation/onboading/utils/onboading_title_subtitle.dart';
import 'package:vault_app/presentation/onboading/utils/privacy_permision_box.dart';
import 'package:vault_app/presentation/onboading/utils/privacy_permision_checkup_text.dart';
import 'package:vault_app/utils/app_image.dart';

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
            OnboadingTitleSubtitle(),
            PrivacyPermisionBox(),
            PrivacyPermisionCheckupText(),
            AgreeContinueButton(),
            DesagreeButton()
          ],
        ),
      ),
    );
  }
}
