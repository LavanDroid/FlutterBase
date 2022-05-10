import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants/app_colors.dart';
import 'constants/app_constants.dart';
import 'constants/app_route.dart';
import 'constants/app_string.dart';
import 'routes/route_generator.dart';

main() async {
  await GetStorage.init('USER_STORAGE');
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return screenUtils();
  }
}

Widget screenUtils() {
  return MediaQuery(
    data: MediaQueryData.fromWindow(WidgetsBinding.instance!.window),
    child: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        builder: (child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.applicationTitle,
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(
              milliseconds: AppConstants.appTransitionDuration,
            ),
            builder: (context, widget) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!);
            },
            theme: ThemeData(
              primarySwatch: AppColors.appThemeColor,
              fontFamily: 'roboto',
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light,
              ),
            ),
            navigatorKey: navigatorKey,
            initialRoute: AppRoutes.initial,
            getPages: RouteGenerator.routes,
            unknownRoute: RouteGenerator.unknownRoute,
          );
        }),
  );
}
