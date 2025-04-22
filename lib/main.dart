import 'package:Food_Khan/view/auth/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
  GetMaterialApp(
    home: const SplashScreen(),
    theme: ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto'
      ),
  ));
}