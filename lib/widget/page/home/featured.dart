import 'package:flutter/material.dart';

Widget Fetured(Color color, Image BGImage) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 13),
    height: 288,
    width: 363,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: BGImage,
  );
}
