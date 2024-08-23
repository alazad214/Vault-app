import 'package:flutter/material.dart';
import 'package:vault_app/utils/color.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      elevation: 4,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blueGrey,
      appBarTheme: AppBarTheme(
        color: Colors.blueGrey,
        elevation: 4,
      ),
      scaffoldBackgroundColor: AppColor.primary);
}
