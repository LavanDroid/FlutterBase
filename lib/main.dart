import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/app_constants.dart';
import 'constants/app_route.dart';
import 'constants/app_string.dart';
import 'routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.applicationTitle,
      defaultTransition: Transition.rightToLeft,
      transitionDuration:
          const Duration(milliseconds: AppConstants.appTransitionDuration),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'verdana',
      ),
      initialRoute: AppRoutes.initial,
      getPages: RouteGenerator.routes,
    );
  }
}
