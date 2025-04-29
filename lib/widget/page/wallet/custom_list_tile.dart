import 'package:flutter/material.dart';

Widget CustomListTile(IconData icon, String title) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.deepOrange.shade200,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon, color: Colors.white),
        //SizedBox(width: 10),
        Text(title, style: TextStyle(color: Colors.white, fontSize: 14)),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
            size: 18,
          ),
        ),
      ],
    ),
  );
}
