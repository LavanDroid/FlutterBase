import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

import '../constants/app_constants.dart';
import '../constants/app_enum.dart';
import '../constants/app_string.dart';

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

  static void getStaticPrint(dynamic e, {int printType = 1}) {
    // 1 - Default, 2 - Request, 3 - Response
    if (!AppConstants.inProduction) {
      switch (printType) {
        case 2:
          printRequest(e);
          break;
        case 3:
          printResponse(e);
          break;
        default:
          developer.log('$e');
          break;
      }
    }
  }
}

void printRequest(dynamic text) {
  developer.log('\x1B[36m$text\x1B[0m');
}

void printResponse(dynamic text) {
  developer.log('\x1B[34m$text\x1B[0m');
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

  call(String msg, {int msgType = 1}) {
    msg = (msg.toString().trim().isEmpty ||
            msg.toString().trim().toLowerCase() == 'null')
        ? AppStrings.errorDiaWentWrong
        : msg.toString();
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        backgroundColor:
            msgType == ToastType.error.value ? Colors.red : Colors.blueGrey);
  }
}

class ValidString {
  //* Singleton logic
  ValidString._privateConstructor();
  static final ValidString _instance = ValidString._privateConstructor();
  factory ValidString() {
    return _instance;
  }

  call(dynamic input) {
    //* String is valid or not
    //* if "not" return empty string
    return input == null ||
            input.toString().trim().isEmpty ||
            input.toString().trim().toLowerCase() == 'null'
        ? ''
        : input.toString().trim();
  }
}

class IsFieldEmpty {
  //* Singleton logic
  IsFieldEmpty._privateConstructor();
  static final IsFieldEmpty _instance = IsFieldEmpty._privateConstructor();
  factory IsFieldEmpty() {
    return _instance;
  }

  call(dynamic input) {
    //* Validate: field is empty or not
    return input == null || input.toString().trim().isEmpty;
  }
}
