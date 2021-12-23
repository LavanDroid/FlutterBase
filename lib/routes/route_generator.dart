import 'package:flutter_x_base/base/app_base.dart';
import 'package:flutter_x_base/constants/app_route.dart';
import 'package:flutter_x_base/home/home.dart';
import 'package:flutter_x_base/pages/profile/profile.dart';
import 'package:get/get.dart';

class RouteGenerator {
  //* Singleton logic
  RouteGenerator._privateConstructor();
  static final RouteGenerator _instance = RouteGenerator._privateConstructor();
  factory RouteGenerator() {
    return _instance;
  }

  static final routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const MyHomePage(),
      //middlewares: [MyMiddleware()],
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const MyProfilePage(),
    ),
  ];
}

class MyMiddleware extends GetMiddleware with AppBase {
  //* Singleton logic
  MyMiddleware._privateConstructor();
  static final MyMiddleware _instance = MyMiddleware._privateConstructor();
  factory MyMiddleware() {
    return _instance;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    appPrint(page?.name);
    return super.onPageCalled(page);
  }
}
