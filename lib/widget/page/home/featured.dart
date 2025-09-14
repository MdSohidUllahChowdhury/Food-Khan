import 'package:flutter/material.dart';

Widget Fetured(Color color, Image BGImage) {
  return Container(
    margin: EdgeInsets.only(top: 10,left: 13,right: 13),
    height: 200,
    width: double.infinity,
    decoration: BoxDecoration(
      color: color,
      //borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
    child: Expanded(child: BGImage),
  );
}
