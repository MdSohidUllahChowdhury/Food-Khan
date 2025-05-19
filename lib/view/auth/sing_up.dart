import 'package:Food_Khan/view/auth/log_in.dart';
import 'package:Food_Khan/widget/auth/section.dart';
import 'package:Food_Khan/widget/auth/tost_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: Color(0xff42D674),
            ),
            child: Column(
              children: [
                const SizedBox(height: 110),
                const Text(
                  'Food Khan',
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1.4,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Create an account so you can explore all the\nexisting Yaaami food",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 1.4,
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 17, right: 17),
              height: MediaQuery.of(context).size.height * 0.52,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      letterSpacing: 1.4,
                      fontSize: 22,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),
                  Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SectionName(
                          authControler: emailController,
                          nameit: 'Email',
                          isRequired: true,
                          icon: const Icon(Icons.email),
                        ),
                        const SizedBox(height: 18),
                        SectionName(
                          authControler: passwordController,
                          nameit: 'Password',
                          forpassword: true,
                          isRequired: true,
                          icon: const Icon(Icons.lock),
                        ),
                        const SizedBox(height: 18),
                        SectionName(
                          nameit: 'Confirm Password',
                          forpassword: true,
                          isRequired: true,
                          icon: Icon(Icons.lock),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              try {
                                await auth.createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                                Get.offAll(() => const Login());
                              } catch (error) {
                                TostMessage().errorMessage(error.toString());
                              }
                            }
                          },
                          style: ButtonStyle(
                            elevation: const WidgetStatePropertyAll(0),
                            minimumSize: WidgetStateProperty.all<Size>(
                              const Size(300, 55),
                            ),
                            backgroundColor: WidgetStateProperty.all<Color>(
                              const Color(0xff42D674),
                            ),
                          ),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.2,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Get.to(() => const Login()),
                    child: const Text(
                      'Already Have an Account?',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
