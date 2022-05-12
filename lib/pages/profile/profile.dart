import 'package:flutter/material.dart';

import '../../base/app_base.dart';
import '../../constants/app_string.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);
  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> with AppBase {
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
            title: const Text(AppStrings.appBarProfile),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: const Text(
                      "Profile Page",
                    ),
                    onTap: () => showSnackBar(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
