import 'package:Food_Khan/view/auth/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashscreen();
  }

  splashscreen() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Get.offAll(() => const WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Scaffold(
        backgroundColor: Color(0xfff7f3ef),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/asset/image/logo.png'),
            Text(
              'THE ALTIMATE\n    FOOD APP',
              style: TextStyle(
                color: Color(0xff42D674),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
              ),
            ),
          ],
        ),
      ),
    ).animate().fade().flipH().shimmer(
      color: Colors.green[400],
      duration: const Duration(seconds: 2),
    );
  }
}
