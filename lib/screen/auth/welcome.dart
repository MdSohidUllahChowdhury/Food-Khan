import 'package:Food_Khan/screen/auth/log_in.dart';
import 'package:Food_Khan/screen/auth/sing_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191D21),
      body: Animate(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/asset/image/food_girl.png',
                  height: 250,
                  width: double.infinity,
                ),
                Divider(
                  color: Color(0xff42D674),thickness: 18,
                ),
                const SizedBox(height: 10,),
                Divider(
                  color: Color(0xffFFAC4B),thickness: 18,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Discover Your\nDream Yaaami Food Here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    color: Color(0xff42D674),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                  ),
                ),
                const SizedBox(height: 15),
                const Center(
                  child: Center(
                    child: Text(
                      'Explore all the existing Food based on your\ninterest and your perfection',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.to(() => const Login()),
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        minimumSize: WidgetStateProperty.all<Size>(
                          const Size(140, 45),
                        ),
                        backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xff42D674),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1.2,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => const Register());
                      },
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        minimumSize: WidgetStateProperty.all<Size>(
                          const Size(140, 45),
                        ),
                        backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromARGB(232, 187, 190, 192),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
          .animate()
          .flip(duration: const Duration(seconds: 1))
          .shimmer(
            color: Colors.blueAccent,
            duration: const Duration(seconds: 4),
          ),
    );
  }
}
