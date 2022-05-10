import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../constants/app_constants.dart';
import '../database/user_keys.dart';
import '../main.dart';
import 'app_extension.dart';

class AppBase {
  late var appPrint = AppPrint();
  late var appErrorPrint = AppErrorPrint();
  late var hideKeyBoard = HideKeyBoard();
  late var showSnackBar = ShowSnackBar();
  late var showToast = ShowToast();
  late var validString = ValidString();
  late var isFieldEmpty = IsFieldEmpty();
  final userStorage = GetStorage('USER_STORAGE');
  Timer? apiTimer;

  getScreenWidth() {
    return MediaQuery.of(navigatorKey.currentContext!).size.width;
  }

  getScreenHeight() {
    return MediaQuery.of(navigatorKey.currentContext!).size.height;
  }

  sessionTimedOut() async {
    //Clear Storage
    await userStorage.erase();
    userStorage.write(UserKeys.userLoggedInInt, 0);
    //Get.offAllNamed(AppRoutes.loginRoute);
  }

  Future<bool> delayNavigation(int delayDuration) async {
    bool isFinished =
        await Future.delayed(Duration(milliseconds: delayDuration), () {
      return true;
    });
    return isFinished;
  }

  apiDebounce(
    VoidCallback callback, {
    Duration duration = const Duration(
        milliseconds: AppConstants.doubleClickPreventDelayDuration),
  }) {
    if (apiTimer != null) {
      apiTimer!.cancel();
    }

    apiTimer = Timer(duration, callback);
  }

  // //* Default return api format
  String getApiFormattedDate(DateTime? date,
          {String outputFormat = 'yyyy-MM-dd'}) =>
      DateFormat(outputFormat, 'en-US').format(date!);

  DateTime getDateFormat(String? date, {String outputFormat = 'yyyy-MM-dd'}) =>
      DateFormat(outputFormat, 'en-US').parse(date!);
}
