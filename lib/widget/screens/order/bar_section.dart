import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget BarSection(BuildContext context) {
  return Stack(
    children: [
      Container(
        height: MediaQuery.of(context).size.height*.329,
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
        children: [
          SizedBox(height: 30),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black54),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '  Fast Food',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700,),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('lib/asset/image/food_girl.png',height: 155,)),
        ],
      ),
    ],
  );
}
