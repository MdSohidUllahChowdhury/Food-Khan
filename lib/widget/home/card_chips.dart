import 'package:flutter/material.dart';

Widget cardChips(Color BgColor,Image BGImage){
  return Container(
    margin: EdgeInsets.only(top: 10),
    height: 64,
    width: 103.64,
    decoration: BoxDecoration(
      color: BgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: BGImage
  );
}