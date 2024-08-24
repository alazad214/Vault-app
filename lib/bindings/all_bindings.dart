import 'package:get/get.dart';
import 'package:vault_app/controller/calculator_controller.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculatorController());
  }
}
