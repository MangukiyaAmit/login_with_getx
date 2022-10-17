import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx_new/user_data.dart';
import 'package:login_with_getx_new/view/sign_in_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameTECtr = TextEditingController();
  final usernameTECtr = TextEditingController();
  final passWordTECtr = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List lst = [
    'assets/images/3.png',
    'assets/images/2.png',
    'assets/images/4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff17171F),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Text(
                  'Create account',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey.shade700,
            thickness: 0.5,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameTECtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This is required.";
                      }
                    },
                    onTap: () {},
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                        fillColor: Color(0xff6C6C74),
                        filled: true),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: usernameTECtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This is required.";
                      }
                    },
                    onTap: () {},
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                        fillColor: Color(0xff6C6C74),
                        filled: true),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: passWordTECtr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This is required.";
                      }
                    },
                    onTap: () {},
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                      fillColor: Color(0xff6C6C74),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      color: Color(0xff39FFC2),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(
                              "hash:${Crypt.sha256(passWordTECtr.text, salt: "code5656")}");

                          Users().users.add({
                            "name": nameTECtr.text,
                            "username": usernameTECtr.text,
                            "password": Crypt.sha256(passWordTECtr.text,
                                salt: "code5656")
                          });

                          print(Users().users);
                          Get.offAll(SignInScreen());
                        } else {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              backgroundColor: Color(0xff39FFC2),
                              message: "Please fill required fields.",
                              textStyle: TextStyle(
                                color: Color(0xff17171F),
                                fontSize: 17,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'or sign up with',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) => GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade800),
                          ),
                          child: Center(
                            child: Image.asset(
                              lst[index],
                              height: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Color(0xff39FFC2),
                            fontSize: 13,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
