import 'package:Food_Khan/model/routes/navigation_bar.dart';
import 'package:Food_Khan/view/auth/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckUserLogin extends StatefulWidget {
  const CheckUserLogin({super.key});

  @override
  State<CheckUserLogin> createState() => _CheckUserLoginState();
}

class _CheckUserLoginState extends State<CheckUserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2), () => CheckUserLogin()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
  void CheckUserLogin(){
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is logged in, navigate to home screen
      Get.offAll(()=> NavigationControll());
    } else {
      // User is not logged in, navigate to login screen
      Get.offAll(()=> const SplashScreen());
    }
  }
}