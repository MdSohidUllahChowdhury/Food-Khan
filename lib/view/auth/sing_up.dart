import 'package:food_khan/view/auth/log_in.dart';
import 'package:food_khan/widget/auth/section.dart';
import 'package:food_khan/widget/auth/tost_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
    
    final formkey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    FirebaseAuth auth = FirebaseAuth.instance;
  
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
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: const BoxDecoration(
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
                      "Create an account so you can explore all the\nexisting Yaaami food",
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
          
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 110, left: 17, right: 17),
                  height: MediaQuery.of(context).size.height * 0.52,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Create Account',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 22,
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
                              authControler: emailController,
                              nameit: 'Email',
                              isRequired: true,
                              icon: const Icon(Icons.email,size: 18),
                            ),
                            const SizedBox(height: 16),
                            SectionName(
                              authControler: passwordController,
                              nameit: 'Password',
                              forpassword: true,
                              isRequired: true,
                              icon: const Icon(Icons.password,size: 18,),
                            ),
                            const SizedBox(height: 16),
                            SectionName(
                              nameit: 'Confirm Password',
                              forpassword: true,
                              isRequired: true,
                              icon: Icon(Icons.password,size: 18,),
                            ),
                            const SizedBox(height: 25),
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
                                  const Color(0xffFFAC4B),
                                ),
                              ),
                              child: const Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 1.2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
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
        ),
      ),
    );
  }
}
