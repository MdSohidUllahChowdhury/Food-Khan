import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget cardChips(Color BgColor, Image BGImage) {
  return InkWell(
    onTap: () {
      Get.snackbar("The Feature is Coming Soon", "Development is in Progress",backgroundColor: Color(0xffD0F1EB),);
    },
    child: Container(
      margin: EdgeInsets.only(top: 10,left: 10),
      height: 64,
      width: 103.64,
      decoration: BoxDecoration(
        color: BgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: BGImage,
    ),
  );
}
