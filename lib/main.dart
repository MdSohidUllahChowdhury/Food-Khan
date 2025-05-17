import 'package:Food_Khan/firebase_options.dart';
import 'package:Food_Khan/controller/provider/add_cart.dart';
import 'package:Food_Khan/view/auth/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartController(),
      child: GetMaterialApp(
        home: const SplashScreen(),
        theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      ),
    ),
  );
}