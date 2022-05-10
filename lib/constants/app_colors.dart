import 'package:flutter/material.dart';

class AppColors {
  //* Singleton logic
  AppColors._privateConstructor();
  static final AppColors _instance = AppColors._privateConstructor();
  factory AppColors() {
    return _instance;
  }

  static const Color appColor = Color(0xffEA8326);
  static const MaterialColor appThemeColor = MaterialColor(
    0xffEA8326,
    <int, Color>{
      50: Color.fromRGBO(234, 131, 38, 0.1),
      100: Color.fromRGBO(234, 131, 38, 0.2),
      200: Color.fromRGBO(234, 131, 38, 0.3),
      300: Color.fromRGBO(234, 131, 38, 0.4),
      400: Color.fromRGBO(234, 131, 38, 0.5),
      500: Color.fromRGBO(234, 131, 38, 0.6),
      600: Color.fromRGBO(234, 131, 38, 0.7),
      700: Color.fromRGBO(234, 131, 38, 0.8),
      800: Color.fromRGBO(234, 131, 38, 0.9),
      900: Color.fromRGBO(234, 131, 38, 1),
    },
  );
}
