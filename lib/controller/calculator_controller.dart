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

  RxString inputValue = RxString('');
  RxString result = RxString('0');

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

  void buttonState(String text) {
    if (text == "AC") {
      inputValue.value = '';
      result.value = '0';
      update();
      return;
    }

    if (text == "C") {
      if (inputValue.value.isNotEmpty) {
        inputValue.value =
            inputValue.value.substring(0, inputValue.value.length - 1);
        update();
        return;
      }
    }

    if (text == "=") {
      calculateResult();
      return;
    }

    if (["+", "-", "*", "÷"].contains(text)) {
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

      final double finalResult = _evaluateExpression(expression);

      result.value = finalResult.toString();
      inputValue.value = ''; // Clear input after showing result
      update();
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: Invalid operation");
      result.value = '0';
      inputValue.value = '';
      update();
    }
  }

  double _evaluateExpression(String expression) {
    try {
      final tokens = _tokenize(expression);
      final result = _evaluateTokens(tokens);
      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: Invalid expression");
      return 0.0;
    }
  }

  List<String> _tokenize(String expression) {
    final regex = RegExp(r'(\d+\.?\d*|\+|\-|\*|\/)');
    return regex
        .allMatches(expression)
        .map((match) => match.group(0)!)
        .toList();
  }

  double _evaluateTokens(List<String> tokens) {
    final List<String> precedence1 = [];
    int i = 0;

    while (i < tokens.length) {
      if (tokens[i] == '*' || tokens[i] == '/') {
        final double operand1 = double.parse(precedence1.removeLast());
        final double operand2 = double.parse(tokens[++i]);
        final double result =
            tokens[i - 1] == '*' ? operand1 * operand2 : operand1 / operand2;
        precedence1.add(result.toString());
      } else {
        precedence1.add(tokens[i]);
      }
      i++;
    }

    double result = double.parse(precedence1[0]);
    i = 1;

    while (i < precedence1.length) {
      final operator = precedence1[i];
      final double operand = double.parse(precedence1[i + 1]);
      result = operator == '+' ? result + operand : result - operand;
      i += 2;
    }

    return result;
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
    if (!inputValue.value.contains('.')) {
      inputValue.value += '.';
      update();
    }
  }

  void addNumber(String number) {
    inputValue.value += number;
    update();
  }
}
