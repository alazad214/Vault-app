import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controller/calculator_controller.dart';

import '../../theme/controller/theme_controller.dart';

Widget calculatorButton(String button) {
  final controller = Get.put(CalculatorController());
  final themecontroller = Get.put(ThemeController());
  return InkWell(onTap: () {
    controller.buttonState(button);
  }, child: Obx(() {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: controller.buttonBgColor(button),
          borderRadius: BorderRadius.circular(
              themecontroller.selectTheme.value == 0 ? 15.0 : 400),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 1)
          ]),
      child: Text(
        button,
        style: TextStyle(
            color: controller.buttonTextColor(button),
            fontSize: 35.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }));
}
