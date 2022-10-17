import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_with_getx_new/view/home_screen.dart';
import 'package:login_with_getx_new/view/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? UserEmail;
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        if (GetStorage().read("isLogin")) {
          Get.off(HomeScreen());
        } else {
          Get.off(SignInScreen());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17171F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/1.png',
              color: Colors.white,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
