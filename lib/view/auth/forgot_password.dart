import 'package:food_khan/widget/auth/section.dart';
import 'package:food_khan/widget/auth/tost_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

TextEditingController email = TextEditingController();
final formKey = GlobalKey<FormState>();
final auth = FirebaseAuth.instance;

class _ForgotPasswordState extends State<ForgotPassword> {
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
                    const SizedBox(height: 280),
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
                      'Reset your password',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              // Form for email input
              Positioned(
                top: MediaQuery.of(context).size.height * 0.513,
                left: 10,
                right: 10,
                child: Card(
                  color: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: formKey,
                          child: SectionName(
                            authControler: email,
                            nameit: 'Email',
                            isRequired: true,
                            icon: const Icon(Icons.email, size: 18),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                await auth.sendPasswordResetEmail(
                                  email: email.text.trim(),
                                );
                                TostMessage().rightMessage(
                                  'Password reset email sent. Please check your inbox.',
                                );
                              } catch (error) {
                                TostMessage().wrongMessage(error.toString());
                              }
                            }
                          },
                          style: ButtonStyle(
                            elevation: const WidgetStatePropertyAll(0),
                            minimumSize: WidgetStateProperty.all<Size>(
                              const Size(285, 50),
                            ),
                            backgroundColor: WidgetStateProperty.all<Color>(
                              const Color(0xffFFAC4B),
                            ),
                          ),
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                              fontFamily: GoogleFonts.abrilFatface().fontFamily,

                              fontSize: 15,
                              color: Colors.white,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            'Back to Login',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
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
