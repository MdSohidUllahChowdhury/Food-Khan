import 'package:Food_Khan/widget/auth/section.dart';
import 'package:Food_Khan/widget/auth/tost_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          height: MediaQuery.of(context).size.height +
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
                    const Text(
                      'Food Khan',
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Reset your password',
                      style: TextStyle(
                        fontSize: 15,
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
                top: MediaQuery.of(context).size.height * 0.5,
                left: 10,
                right: 10,
                child: Card(
                color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                                    TostMessage().errorMessage(
                                        'Password reset email sent. Please check your inbox.');
                                  } catch (error) {
                                    TostMessage().errorMessage(error.toString());
                                  }
                                }
                              },
                              style: ButtonStyle(
                                elevation: const WidgetStatePropertyAll(0),
                                minimumSize: WidgetStateProperty.all<Size>(
                                    const Size(240, 55)),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    const Color(0xffFFAC4B)),
                              ),
                              child: const Text(
                                'Reset Password',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            TextButton(onPressed: () => Get.back(), child:Text(
                              'Back to Login',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                letterSpacing: 1.4,
                              ),
                            )),
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