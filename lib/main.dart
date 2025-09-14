import 'package:Food_Khan/controller/routes/check_user_login.dart';
import 'package:Food_Khan/firebase_options.dart';
import 'package:Food_Khan/controller/provider/add_cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartController(),
      child: GetMaterialApp(
        home: CheckUserLogin(),
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff191D21),
          useMaterial3: true, 
          fontFamily: GoogleFonts.dmSans().fontFamily,)
      ),
    ),
  );
}