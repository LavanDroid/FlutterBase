import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/app_base.dart';
import '../constants/app_route.dart';
import '../constants/app_string.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AppBase {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => buildScreen();

  Widget buildScreen() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appBarHome),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: const Text(
                      AppStrings.welcomeMessage,
                    ),
                    onTap: () => Get.toNamed(AppRoutes.profile),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
