import 'package:food_khan/model/routes/navigation_bar.dart';
import 'package:food_khan/view/auth/forgot_password.dart';
import 'package:food_khan/view/auth/sing_up.dart';
import 'package:food_khan/widget/auth/section.dart';
import 'package:food_khan/widget/auth/tost_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height:
              MediaQuery.of(context).size.height +
              MediaQuery.of(context).viewInsets.bottom,
          child: Stack(
            children: [
              // Top gradient background
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xff191D21), Color(0xffFFAC4B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      'FOOD KHAN',
                      style: TextStyle(
                        fontFamily: GoogleFonts.abrilFatface().fontFamily,
                        fontSize: 38,
                        letterSpacing: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Welcome back you've\nbeen missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 1.4,
                      ),
                    ),
                    const SizedBox(height: 34),
                    const Divider(color: Colors.white, thickness: 18),
                    const Divider(color: Color(0xff191D21), thickness: 18),
                    const Divider(color: Color(0xffFFAC4B), thickness: 18),
                  ],
                ),
              ),

              //! Login form container
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 220, left: 20, right: 20),
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.53,
                  decoration: BoxDecoration(
                    //color: Colors.grey.shade500,
                    gradient: LinearGradient(
                      colors: [Color(0xff191D21), Color(0xffFFAC4B)],
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login Here',
                        style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.abrilFatface().fontFamily,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SectionName(
                              authControler: email,
                              nameit: 'Email',
                              isRequired: true,
                              icon: const Icon(Icons.email, size: 18),
                            ),
                            const SizedBox(height: 16),
                            SectionName(
                              authControler: password,
                              nameit: 'Password',
                              forpassword: true,
                              isRequired: true,
                              icon: const Icon(Icons.password, size: 18),
                            ),
                            //const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed:
                                    () => Get.to(() => const ForgotPassword()),
                                child: Text(
                                  'Forgot your password?       ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    letterSpacing: 1.4,
                                  ),
                                ),
                              ),
                            ),
                            //const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                    await auth
                                        .signInWithEmailAndPassword(
                                          email: email.text.trim(),
                                          password: password.text.trim(),
                                        )
                                        .then((onValue) {
                                          TostMessage().errorMessage(
                                            onValue.user!.email.toString(),
                                          );
                                        });
                                    Get.offAll(
                                      () => const NavigationControll(),
                                    );
                                  } catch (error) {
                                    TostMessage().errorMessage(
                                      error.toString(),
                                    );
                                  }
                                }
                              },
                              style: ButtonStyle(
                                elevation: const WidgetStatePropertyAll(0),
                                minimumSize: WidgetStateProperty.all<Size>(
                                  const Size(270, 50),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xffFFAC4B),
                                ),
                              ),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                  fontFamily:
                                      GoogleFonts.abrilFatface().fontFamily,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 1.4,
                        ),
                      ),
                      const SizedBox(height: 3),
                      TextButton(
                        onPressed: () => Get.offAll(() => const Register()),
                        child: const Text(
                          'Create New Account',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 1.4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
