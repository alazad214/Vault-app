import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/controller/app_controller.dart';
import 'package:vault_app/core/service/shared_services.dart';
import 'package:vault_app/presentation/theme/controller/theme_controller.dart';
import 'package:vault_app/utils/app_config.dart';
import 'package:vault_app/utils/app_image.dart';
import 'package:vault_app/widgets/text1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(AppController());
  final themecontroller = Get.put(ThemeController());

  ///Save Theme Index
  saveTheme() async {
    SharedServices().getData(SetType.int, 'select_theme').then((value) {
      themecontroller.selectTheme.value = value;
    });
  }

  @override
  void initState() {
    ///Chack and open to next screen
    Future.delayed(Duration(seconds: 3), () {
      controller.checkAppState();
    });

    ///Save Theme
    saveTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                height: screenSize.height / 1,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImage.appLogo,
                      width: screenSize.width / 4,
                    ),
                    SizedBox(height: 10),
                    Text1(
                      text: AppConfig.appName,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
