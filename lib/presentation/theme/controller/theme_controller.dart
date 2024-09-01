import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxInt selectTheme = RxInt(0);
  List<String> themes = [
    'assets/images/theme.jpg',
    'assets/images/vault.png',
  ];
  changeTheme(int index) {
    selectTheme.value = index;
    update();
  }
}
