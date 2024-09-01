import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vault_app/core/service/shared_services.dart';
import 'package:vault_app/presentation/calculator/views/calculator_screen.dart';
import 'package:vault_app/utils/color.dart';
import 'package:vault_app/widgets/button1.dart';

class AgreeContinueButton extends StatelessWidget {
  const AgreeContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button1(
      text: 'Agree & Continue',
      ontap: () async {
        Get.offAll(() => CalculatorScreen());
        await SharedServices().setData(SetType.bool, 'already_opened', true);
        Fluttertoast.showToast(
          backgroundColor: AppColor.primary,
          msg:
              'You are aware of all permissions and privacy policies of this app',
        );
      },
    );
  }
}
