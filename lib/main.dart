import 'package:application_backend/model/routes/navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
  MaterialApp(
    home: NavigationControll(),
    theme: ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto'
      ),
  ));
}