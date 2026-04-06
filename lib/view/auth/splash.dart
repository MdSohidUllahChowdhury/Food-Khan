import 'package:food_khan/view/auth/welcome.dart';
import 'package:food_khan/controller/routes/navigation_bar.dart';
import 'package:food_khan/controller/firebase/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _initializeApp() async {
    // Wait for splash animation to complete
    await Future.delayed(const Duration(seconds: 4));

    // Check user authentication status
    final user = FirebaseAuth.instance.currentUser;

    if (mounted) {
      if (user != null && !SessionManager.instance.isSessionExpired()) {
        // User is logged in and session is valid
        print('✅ User logged in: ${user.email}');
        Get.offAll(() => NavigationControll());
      } else {
        // User is not logged in or session expired
        print('❌ User not logged in or session expired');
        Get.offAll(() => const WelcomeScreen());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Animate(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('lib/asset/image/splashLogo.png')],
        ),
      ).animate().fade().flipH().shimmer(
        color: Colors.white,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
