import 'package:food_khan/controller/firebase_auth/auth_data_collection.dart';
import 'package:food_khan/view/auth/log_in.dart';
import 'package:food_khan/widget/auth/section.dart';
import 'package:food_khan/widget/auth/tost_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

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
                    const SizedBox(height: 34),
                    Divider(color: Color(0xffffffff), thickness: 18),
                    Divider(color: Color(0xff191D21), thickness: 18),
                    Divider(color: Color(0xffFFAC4B), thickness: 18),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 220, left: 17, right: 17),
                  height: MediaQuery.of(context).size.height * 0.52,
                  decoration: BoxDecoration(
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
                        'Create Account',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 22,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.abrilFatface().fontFamily,
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
                              authControler: nameController,
                              nameit: 'Name',
                              isRequired: true,
                              icon: const Icon(
                                Icons.panorama_photosphere_outlined,
                                size: 18,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SectionName(
                              authControler: emailController,
                              nameit: 'Email',
                              isRequired: true,
                              icon: const Icon(Icons.email, size: 18),
                            ),
                            const SizedBox(height: 16),
                            SectionName(
                              authControler: phoneController,
                              nameit: 'Phone',
                              forpassword: false,
                              isRequired: true,
                              icon: const Icon(Icons.sim_card, size: 18),
                            ),
                            const SizedBox(height: 16),
                            SectionName(
                              nameit: 'Password',
                              authControler: passwordController,
                              forpassword: true,
                              isRequired: true,
                              icon: Icon(Icons.password, size: 18),
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
                                    Map<String, dynamic> info = {
                                      "User Name": nameController.text.trim(),
                                      "Email": emailController.text.trim(),
                                      "Phone": phoneController.text.trim(),
                                    };
                                    final User? userID =
                                        FirebaseAuth.instance.currentUser;
                                    await Database().authInfo(
                                      info,
                                      userID!.uid,
                                    );
                                    Get.offAll(() => const Login());
                                    TostMessage().rightMessage(
                                      "Account Created",
                                    );
                                  } catch (error) {
                                    TostMessage().wrongMessage(
                                      error.toString(),
                                    );
                                  }
                                }
                              },
                              style: ButtonStyle(
                                elevation: const WidgetStatePropertyAll(0),
                                minimumSize: WidgetStateProperty.all<Size>(
                                  const Size(315, 50),
                                ),
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xffFFAC4B),
                                ),
                              ),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 1.2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily:
                                      GoogleFonts.abrilFatface().fontFamily,
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
