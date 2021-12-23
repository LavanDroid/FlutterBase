import 'package:flutter/material.dart';

class AppColors {
  //* Singleton logic
  AppColors._privateConstructor();
  static final AppColors _instance = AppColors._privateConstructor();
  factory AppColors() {
    return _instance;
  }

  static const Color japaneseLaurel = Color(0xFF007700);
}
