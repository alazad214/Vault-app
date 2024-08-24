import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controller/calculator_controller.dart';

Widget calculatorButton(String button) {
  final controller = Get.put(CalculatorController());
  return InkWell(
    onTap: () {
      controller.buttonState(button);
    },
    child: Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: controller.buttonBgColor(button),
          borderRadius: BorderRadius.circular(15.0),
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
    ),
  );
}
