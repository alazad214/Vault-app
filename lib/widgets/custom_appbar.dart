import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault_app/utils/color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bgcolor;
  final leading;
  final Actions;
  final actionOntap;
  const CustomAppbar(
      {super.key,
      this.title,
      this.bgcolor,
      this.leading,
      this.Actions,
      this.actionOntap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title ?? ""),
      backgroundColor: bgcolor ?? Colors.transparent,
      leading: leading == true
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back))
          : null,
      actions: Actions ??
          [
            IconButton(
                onPressed: actionOntap,
                icon: Icon(
                  Icons.settings,
                  color: AppColor.secondary,
                ))
          ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
