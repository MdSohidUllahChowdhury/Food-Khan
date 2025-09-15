import 'package:flutter/material.dart';

Widget cardMenu(
  Color BgColor,
  Image BGImage,
  String productName,
  star,
  offPrice,
  restaurant,
) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 13),
    height: 236,
    width: 200,
    decoration: BoxDecoration(
      color: BgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Center(child: BGImage),

        Align(
          alignment: Alignment.topLeft,
          child: Text(
            productName,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 6),
        Row(
          children: [
            SizedBox(width: 10),
            Icon(Icons.star, color: Color(0xffFFAC4B), size: 15),
            Text(
              star,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
            SizedBox(width: 10),
            Icon(Icons.circle, color: Color(0xffffffff), size: 10),

            Text(
              offPrice,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w100,
                color: Color.fromARGB(255, 241, 13, 13),
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              '  Restaurant',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
            ),
            SizedBox(width: 10),
            Icon(Icons.circle, color: Color(0xffffffff), size: 10),

            Text(
              restaurant,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ],
    ),
  );
}
