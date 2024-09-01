import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/core/service/shared_services.dart';
import 'package:vault_app/presentation/theme/controller/theme_controller.dart';
import 'package:vault_app/widgets/button1.dart';
import 'package:vault_app/widgets/custom_appbar.dart';

class ThemeScreen extends StatelessWidget {
  ThemeScreen({super.key});
  final controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          leading: true,
          title: 'Theme',
        ),
        body: GetBuilder<ThemeController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GridView.builder(
                    itemCount: controller.themes.length,
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.50,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.changeTheme(index);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: controller.selectTheme.value == index
                                      ? Colors.blue
                                      : Colors.white),
                              image: DecorationImage(
                                  image: AssetImage(controller.themes[index]),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              controller.selectTheme.value == index
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.blue,
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                      );
                    }),
                Button1(
                  text: 'Theme Theme',
                  ontap: () {
                    SharedServices().setData(SetType.int, 'select_theme',
                        controller.selectTheme.value);
                    Get.back();
                  },
                )
              ],
            ),
          );
        }));
  }
}
