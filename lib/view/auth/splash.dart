import 'package:food_khan/view/auth/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashscreen() async {
    await Future.delayed(const Duration(seconds: 4), () {});
    Get.offAll(() => const WelcomeScreen());
  }

  @override
  void initState() {
    super.initState();
    splashscreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f3ef),
      body: Animate(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/asset/image/splashLogo.png'),
          ],
        ),
      ).animate().fade().flipH().shimmer(
        color: Colors.white,
        duration: const Duration(seconds:4),
      ),
    );
  }
}
