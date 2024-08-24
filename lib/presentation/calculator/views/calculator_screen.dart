import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controller/calculator_controller.dart';
import 'package:vault_app/presentation/calculator/widget/calculator_button.dart';
import 'package:vault_app/widgets/custom_appbar.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(),
        body: GetBuilder<CalculatorController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Please Enter Your Password!'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          controller.inputValue.value,
                          style: TextStyle(fontSize: 35.0),
                        ),
                        Text(
                          controller.result.value,
                          style: TextStyle(
                              fontSize: 45.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //Calculator Button
                  GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0),
                      itemBuilder: (context, index) {
                        final button = controller.buttons[index];
                        return button.isEmpty
                            ? SizedBox()
                            : calculatorButton(button);
                      })
                ],
              ),
            ),
          );
        }));
  }
}
