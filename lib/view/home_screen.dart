import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_with_getx_new/view/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17171F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/1.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome to the world of music',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                GetStorage().write("isLogin", false);
                Get.offAll(SignInScreen());
              },
              child: Text(
                'Log Out',
              ),
            )
          ],
        ),
      ),
    );
  }
}
