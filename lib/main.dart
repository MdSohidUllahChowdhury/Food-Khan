import 'package:food_khan/controller/routes/check_user_login.dart';
import 'package:food_khan/controller/firebase_auth/firebase_options.dart';
import 'package:food_khan/controller/provider/add_cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://mvgxvyslhadpkxmuaxgm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im12Z3h2eXNsaGFkcGt4bXVheGdtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjExMjkzMjcsImV4cCI6MjA3NjcwNTMyN30.ToML9Aw0CF2y7YP_CgAopOJqpYgCsR7QFZS1xQSXS3k',
  );
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