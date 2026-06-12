import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      centerTitle: true,
    ),
  );
}
