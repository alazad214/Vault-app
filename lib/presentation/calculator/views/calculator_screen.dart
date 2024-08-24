import 'package:flutter/material.dart';
import 'package:vault_app/widgets/custom_appbar.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Center(
        child: Text("Calculator Screen"),
      ),
    );
  }
}
