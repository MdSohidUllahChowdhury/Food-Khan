import 'package:food_khan/controller/routes/navigation_bar.dart';
import 'package:food_khan/controller/firebase/session_manager.dart';
import 'package:food_khan/view/auth/splash.dart';
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
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              // Check user login and session status
              _checkUserLogin();
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  void _checkUserLogin() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && !SessionManager.instance.isSessionExpired()) {
      // User is logged in and session is valid
      print('User logged in: ${user.email}');
      Get.offAll(() => NavigationControll());
    } else {
      // User is not logged in or session expired
      print('User not logged in or session expired');
      Get.offAll(() => const SplashScreen());
    }
  }
}
