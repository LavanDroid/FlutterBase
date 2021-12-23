import 'dart:io';

class AppConstants {
  //* Singleton logic
  AppConstants._privateConstructor();
  static final AppConstants _instance = AppConstants._privateConstructor();
  factory AppConstants() {
    return _instance;
  }

  static const bool inProduction = bool.fromEnvironment('dart.vm.product');
  static bool isAndroid = Platform.isAndroid;
  static bool isIOS = Platform.isIOS;
  static const int appTransitionDuration = 300;
  static const int appDelayDuration = 500;
}
