import 'package:flutter/material.dart';
import 'package:food_khan/widget/auth/tost_alert.dart';

Widget categorieChips(Color BgColor, Image BGImage,String categorie_name) {
  return InkWell(
    onTap: () {
      TostMessage().upcoming("The Feature is Coming Soon");
    },
    child: Container(
      margin: EdgeInsets.only(top: 10,left: 10),
      height: 34,
      width:90,
      decoration: BoxDecoration(
        color: BgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white,width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BGImage,
          Text(categorie_name,style: TextStyle(
            fontSize: 10,fontWeight: FontWeight.w600
          ),)
        ],
      ),
    ),
  );
}
