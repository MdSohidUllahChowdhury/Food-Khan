import 'package:food_khan/controller/api/supabase_api.dart';
import 'package:food_khan/controller/routes/check_user_login.dart';
import 'package:food_khan/controller/firebase/firebase_options.dart';
import 'package:food_khan/controller/provider/cart_provider.dart';
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
    url: SupabaseAPI().url,
    anonKey: SupabaseAPI().anonKey,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartController(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: CheckUserLogin(),
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff191D21),
          useMaterial3: true,
          fontFamily: GoogleFonts.jost().fontFamily,
        ),
      ),
    ),
  );
}
