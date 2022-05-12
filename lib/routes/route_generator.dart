import 'package:get/get.dart';

import '../base/app_base.dart';
import '../constants/app_route.dart';
import '../helpers/not_found.dart';
import '../home/home.dart';
import '../pages/profile/profile.dart';

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

  //* Unknown Pages Route *//
  static final unknownRoute = GetPage(
    name: AppRoutes.notFound,
    page: () => const NotFoundPage(),
  );
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
