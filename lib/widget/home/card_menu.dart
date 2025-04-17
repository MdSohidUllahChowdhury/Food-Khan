import 'package:flutter/material.dart';

Widget cardMenu(Color BgColor,Image BGImage){
  return Container(
    margin: EdgeInsets.only(top: 10,right: 15),
    height: 236,
    width: 200,
    decoration: BoxDecoration(
      color: BgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        BGImage,
        SizedBox(height: 20),
        Text(
          "The Taco\nCompany",textAlign: TextAlign.left,
          style: TextStyle(
            fontSize:17,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    )
  );
}