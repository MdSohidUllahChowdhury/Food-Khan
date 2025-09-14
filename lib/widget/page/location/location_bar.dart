import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget LocationBarSection() {
  return Stack(
    children: [
      Container(
        height: 320,
        width: 355,
        decoration: BoxDecoration(
          color: Color(0xffC9EAFD),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(95),
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(160),
          ),
        ),
      ),
      Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 55),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.solidArrowAltCircleLeft, size: 24),
            ),
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '    Restaurant  Takeaway',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1.1,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '  Location Tracking',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset('lib/asset/image/food_girl.png', fit: BoxFit.fitWidth),
        ],
      ),
    ],
  );
}
