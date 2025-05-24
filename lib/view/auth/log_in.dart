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
              gradient: LinearGradient(
                colors: [
                  Color(0xff191D21),
                  Color(0xffFFAC4B),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(

              children: [
                const SizedBox(height: 100),
                const Text(
                    'Food Khan',
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 1.4,
                      color: Color(0xffffffff),
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
                  const SizedBox(height: 8),
                  Divider(color: Color(0xffffffff), thickness: 18),
                  Divider(color: Color(0xffFFAC4B), thickness: 18),    
                  Divider(color: Color(0xff191D21), thickness: 18),
              ],
            ),
          ),
          
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 110,left: 17, right: 17),
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15,),
                  const Text('Login Here',
                    style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
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
                          icon: const Icon(Icons.email,size: 18),
                        ),
                        const SizedBox(height: 16),
                        SectionName(
                          authControler: password,
                          nameit: 'Password',
                          forpassword: true,
                          isRequired: true,
                          icon: const Icon(Icons.password,size: 18,),
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
                        const SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              try {
                                await auth.signInWithEmailAndPassword(
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
                            minimumSize: WidgetStateProperty.all<Size>(const Size(300, 55)),
                            backgroundColor: WidgetStateProperty.all<Color>(const Color(0xffFFAC4B)),
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
