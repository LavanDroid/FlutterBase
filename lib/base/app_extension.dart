import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_x_base/constants/app_constants.dart';
import 'package:flutter_x_base/constants/app_string.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class AppPrint {
  //* Singleton logic
  AppPrint._privateConstructor();
  static final AppPrint _instance = AppPrint._privateConstructor();
  factory AppPrint() {
    return _instance;
  }

  call(dynamic msg) {
    if (!AppConstants.inProduction) {
      developer.log('$msg');
    }
  }

  static void getStaticPrint(dynamic e) {
    if (!AppConstants.inProduction) {
      developer.log('$e');
    }
  }
}

class AppErrorPrint {
  //* Singleton logic
  AppErrorPrint._privateConstructor();
  static final AppErrorPrint _instance = AppErrorPrint._privateConstructor();
  factory AppErrorPrint() {
    return _instance;
  }

  call(dynamic msg) {
    if (!AppConstants.inProduction) {
      printError('🛑 $msg');
    }
  }

  static void getStaticPrint(dynamic e) {
    if (!AppConstants.inProduction) {
      printError('🛑 $e');
    }
  }
}

/* 
Black:   \x1B[30m
Red:     \x1B[31m
Green:   \x1B[32m
Yellow:  \x1B[33m
Blue:    \x1B[34m
Magenta: \x1B[35m
Cyan:    \x1B[36m
White:   \x1B[37m
Reset:   \x1B[0m
 
void printWarning(String text) {
  developer.log('\x1B[33m$text\x1B[0m');
}
*/

void printError(String text) {
  //? developer.log does not display information on the terminal when in release mode.
  developer.log('\x1B[31m$text\x1B[0m');
}

class HideKeyBoard {
  //* Singleton logic
  HideKeyBoard._privateConstructor();
  static final HideKeyBoard _instance = HideKeyBoard._privateConstructor();
  factory HideKeyBoard() {
    return _instance;
  }

  call() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

class ShowSnackBar {
  //* Singleton logic
  ShowSnackBar._privateConstructor();
  static final ShowSnackBar _instance = ShowSnackBar._privateConstructor();
  factory ShowSnackBar() {
    return _instance;
  }

  call() {
    Get.snackbar(
      AppStrings.errorNetwork,
      AppStrings.errorNetworkMsg,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }
}

class ShowToast {
  //* Singleton logic
  ShowToast._privateConstructor();
  static final ShowToast _instance = ShowToast._privateConstructor();
  factory ShowToast() {
    return _instance;
  }

  call(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: msg);
  }
}
