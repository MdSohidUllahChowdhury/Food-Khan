import 'package:food_khan/view/auth/log_in.dart';
import 'package:food_khan/view/auth/sing_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  final String _headerOne =
      "DON'T FELL LIKE\n COOKING.LET'S\n ORDER FOOD DELIVERY";
  final String _headerTwo =
      'Explore all the existing Food based on your\ninterest and your perfection';
  final String _imagePath = 'lib/asset/image/welcome_screen_image.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Animate(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(_imagePath, height: 300, width: double.infinity),
                Divider(color: Color(0xff42D674), thickness: 18),
                const SizedBox(height: 10),
                Divider(color: Color(0xffFFAC4B), thickness: 18),
                const SizedBox(height: 30),
                Text(
                  _headerOne,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GoogleFonts.abrilFatface().fontFamily,
                    fontSize: 26,
                    color: Color(0xff42D674),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Center(
                    child: Text(
                      _headerTwo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
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
          .fadeIn(duration: const Duration(seconds: 2))
          .shimmer(color: Colors.white, duration: const Duration(seconds: 20)),
    );
  }
}
