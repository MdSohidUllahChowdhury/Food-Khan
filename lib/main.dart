import 'package:Food_Khan/model/provider/add_cart.dart';
import 'package:Food_Khan/view/auth/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
  ChangeNotifierProvider(
    create: (context) => CartController(),
    child: GetMaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        ),
    ),
  ));
}