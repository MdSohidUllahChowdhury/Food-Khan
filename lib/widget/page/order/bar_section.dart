import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget BarSection() {
  return Stack(
    children: [
      Container(
        height: 320,
        width: 355,
        decoration: BoxDecoration(
          color: Color(0xffFFAC4B),
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
              icon: Icon(Icons.arrow_left, size: 24),
            ),
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '    Restaurant  Takeaway',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100,color: Colors.black54),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '  Fast Food',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset('lib/asset/image/food_girl.png', fit: BoxFit.fitWidth),
        ],
      ),
    ],
  );
}
