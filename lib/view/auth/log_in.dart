import 'package:Food_Khan/model/routes/navigation_bar.dart';
import 'package:Food_Khan/view/auth/sing_up.dart';
import 'package:Food_Khan/widget/auth/section.dart';
import 'package:Food_Khan/widget/auth/tost_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final auth = FirebaseAuth.instance;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xff191D21),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: double.infinity,
            decoration:  const BoxDecoration(
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
                    "Welcome back you've\nbeen missed!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
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
              margin: const EdgeInsets.only(top: 120,left: 17, right: 17),
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15,),
                  const Text(
                    'Login Here',
                    style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.4,
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
                          authControler: email,
                          nameit: 'Email',
                          isRequired: true,
                          icon: const Icon(
                            Icons.email,
                          ),
                        ),
                        const SizedBox(height: 18),
                        SectionName(
                          authControler: password,
                          nameit: 'Password',
                          forpassword: true,
                          isRequired: true,
                          icon: const Icon(
                            Icons.lock,
                            //color: Color(0xff42D674),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Forgot your password?       ',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                              letterSpacing: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
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
                                Get.offAll(() => const NavigationControll());
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
                            'Log In',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
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
                ],
              ),
            ),
          ),
       ],
      ),
    );
  }
}
