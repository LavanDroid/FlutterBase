import 'dart:convert';

import 'package:dio/dio.dart';

import '../../base/app_base.dart';
import '../../base/app_extension.dart';
import '../../constants/app_enum.dart';
import '../../constants/app_string.dart';

class DioException implements Exception {
  String message = '';
  AppBase appBase = AppBase();

  @override
  String toString() => message;

  DioException.createDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = AppStrings.errorDiaReqCancel + ', Code: 601';
        break;

      case DioErrorType.connectTimeout:
        message = AppStrings.errorDiaConnectionTimeOut + ', Code: 602';
        break;

      case DioErrorType.receiveTimeout:
        message = AppStrings.errorDiaResTimeOut + ', Code: 603';
        break;

      case DioErrorType.sendTimeout:
        message = AppStrings.errorDiaReqTimeOut + ', Code: 604';
        break;

      case DioErrorType.response:
        message = handleResponseError(dioError.response);
        break;

      case DioErrorType.other:
        appBase.showToast(AppStrings.errorDiaNoInternet,
            msgType: ToastType.error.value);

        /// Using GetX therefore GetBack can't use,
        /// because if we using SnackBar toast only closed,
        /// loading dialog not closed, So im use toast
        /// appBase.showSnackBar();
        message = AppStrings.errorDiaNoInternet + ', Code: 605';
        break;

      default:
        message = AppStrings.errorDiaWentWrong + ', Code: 606';
        break;
    }
  }

  String handleResponseError(Response? response) {
    AppErrorPrint.getStaticPrint('Response error: ' + response.toString());
    String msg = handleResponseMessage(response);
    try {
      if (response != null &&
          response.statusCode != null &&
          response.statusCode! > 0) {
        switch (response.statusCode) {
          case 400:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaBadReq) +
                ', Code ${response.statusCode}';
          case 401:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaUnAuth) +
                ', Code ${response.statusCode}';
          case 403:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaServerRefuses) +
                ', Code ${response.statusCode}';
          case 404:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaPageNotFound) +
                ', Code ${response.statusCode}';
          case 405:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaReqNotAllowed) +
                ', Code ${response.statusCode}';
          case 500:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaInternalServer) +
                ', Code ${response.statusCode}';
          case 502:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaBadGateway) +
                ', Code ${response.statusCode}';
          case 503:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaNoService) +
                ', Code ${response.statusCode}';
          case 505:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaNoHttp) +
                ', Code ${response.statusCode}';
          default:
            return (!appBase.isFieldEmpty(msg)
                    ? msg
                    : AppStrings.errorDiaUnknownRes) +
                ', Code ${response.statusCode}';
        }
      } else {
        return msg;
      }
    } on Exception catch (_) {
      return AppStrings.errorDiaResWentWrong + 'Code: 607';
    }
  }

  String handleResponseMessage(Response? response) {
    if (response != null) {
      if (response.data != null) {
        /* try {
          AppErrorException appException =
              AppErrorException.fromJson(jsonDecode(response.data));
          if (appException.errors != null &&
              appException.errors!.details != null &&
              appException.errors!.details!.isNotEmpty &&
              !appBase.isFieldEmpty(appException.errors!.details![0].message)) {
            String msg1 =
                appBase.validString(appException.errors!.details![0].message);
            appBase.showToast(msg1);
            // AppErrorPrint.getStaticPrint('Api err handle 1: ' + msg1);
            return msg1;
          } else if (!appBase.isFieldEmpty(appException.message)) {
            appBase.showToast(appBase.validString(appException.message));
            // AppErrorPrint.getStaticPrint('Api err handle 2: ' + appBase.validString(appException.message));
            return appException.message!;
          } else if (!appBase.isFieldEmpty(appException.detail)) {
            appBase.showToast(appBase.validString(appException.detail));
            // AppErrorPrint.getStaticPrint('Api err handle 3: ' + appBase.validString(appException.detail));
            return appException.detail!;
          } /* else if (!appBase.isFieldEmpty(appException.oldPassword)) {
            appBase.showToast(appBase.validString(appException.oldPassword));
            // AppErrorPrint.getStaticPrint('Api err handle 4: ' + appBase.validString(appException.oldPassword));
            return appException.message!;
          } */
          else {
            return AppStrings.errorDiaResWentWrong + 'Code: 608';
          }
          //return AppStrings.errorDiaResWentWrong + 'Code: 608';
        } on Exception catch (_) {
          // return response.toString() + ', Error ->  ' + _.toString();
          appBase.showToast(appBase.validString(response));
          return response.toString();
        } */
        return response.toString();
      } else if (!appBase.isFieldEmpty(response.statusMessage)) {
        appBase.showToast(appBase.validString(response.statusMessage));
        return response.statusMessage!;
      } else {
        appBase.showToast(appBase.validString(response));
        return response.toString();
      }
    } else {
      return AppStrings.errorDiaResWentWrong + 'Code: 609';
    }
  }
}
