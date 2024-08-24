import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:vault_app/utils/color.dart';

class CalculatorController extends GetxController {
  List<String> buttons = [
    "",
    "",
    "AC",
    "C",
    "7",
    "8",
    "9",
    "÷",
    "4",
    "5",
    "6",
    "*",
    "1",
    "2",
    "3",
    "-",
    "0",
    ".",
    "=",
    "+",
  ];

  Color buttonTextColor(String text) {
    if (text == "AC" ||
        text == "C" ||
        text == "÷" ||
        text == "*" ||
        text == "-" ||
        text == "+") {
      return AppColor.secondary;
    } else {
      return AppColor.white;
    }
  }

  Color buttonBgColor(String text) {
    if (text == "=") {
      return AppColor.secondary;
    } else {
      return AppColor.white.withOpacity(0.2);
    }
  }

  RxString inputValue = RxString('');
  RxString result = RxString('0');

  void buttonState(String text) {
    if (text == "AC") {
      inputValue.value = '';
      result.value = '0';
      update();
      return;
    }

    if (text == "C") {
      if (inputValue.isNotEmpty) {
        inputValue.value =
            inputValue.value.substring(0, inputValue.value.length - 1);
        update();
        return;
      } else {
        return;
      }
    }

    if (text == "=") {
      calculateResult();
      return;
    }

    if (text == "+" || text == "-" || text == "*" || text == "÷") {
      addOperator(text);
      return;
    }

    if (text == ".") {
      addDecimal();
      return;
    }

    addNumber(text);
  }

  void calculateResult() {
    try {
      String expression = inputValue.value;
      expression = expression.replaceAll('÷', '/');
      expression = expression.replaceAll('*', '*');

      // Perform the calculation using Dart's `eval`
      final double finalResult = double.parse(_evaluateExpression(expression));

      result.value = finalResult.toString();
      inputValue.value = '';
      update();
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: Invalid operation");
      result.value = '0';
      inputValue.value = '';
      update();
    }
  }

  String _evaluateExpression(String expression) {
    // This is a simple evaluation function.
    // For complex calculations, you might consider using a package like `expressions` or `math_expressions`.
    double evalResult = 0.0;
    // Perform the evaluation logic here.
    // This is a simplified implementation, actual calculation logic might differ.
    return evalResult.toString();
  }

  void addOperator(String operator) {
    if (inputValue.value.isNotEmpty &&
        !["+", "-", "*", "÷"]
            .contains(inputValue.value[inputValue.value.length - 1])) {
      inputValue.value += operator;
      update();
    }
  }

  void addDecimal() {
    if (!inputValue.value.endsWith(".")) {
      inputValue.value += ".";
      update();
    }
  }

  void addNumber(String number) {
    inputValue.value += number;
    update();
  }
}
