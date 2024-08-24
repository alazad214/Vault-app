import 'package:flutter/material.dart';
import 'package:vault_app/utils/color.dart';
import 'package:vault_app/utils/string.dart';

class PrivacyPermisionBox extends StatelessWidget {
  const PrivacyPermisionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height / 2.5,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
      margin: EdgeInsets.only(top: 20.0, left: 15, right: 15, bottom: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColor.white.withOpacity(0.1)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              'Privacy & Permissions Notice!',
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: AppColor.secondary,
            ),
            Text(
              textAlign: TextAlign.start,
              AppString.privacyAndPermissions,
              style: TextStyle(
                color: AppColor.white.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
