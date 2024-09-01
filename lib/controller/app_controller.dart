import 'package:get/get.dart';

import '../core/service/shared_services.dart';
import '../presentation/calculator/views/calculator_screen.dart';
import '../presentation/onboading/views/onboading_screen.dart';

class AppController extends GetxController {
  final sharedServices = SharedServices();

  Future<bool> checkAppFirstTime() async {
    return await sharedServices.getData(SetType.bool, 'already_opened') ??
        false;
  }

  checkAppState() async {
    final alreadyOpened =
        await checkAppFirstTime(); // এখানে await যোগ করা হয়েছে

    if (alreadyOpened == true) {
      Get.offAll(() => CalculatorScreen());
    } else {
      Get.offAll(() => OnboadingScreen());
    }
  }
}
