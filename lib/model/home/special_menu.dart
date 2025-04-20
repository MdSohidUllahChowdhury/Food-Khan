import 'package:application_backend/widget/home/card_menu.dart';
import 'package:flutter/material.dart';

Widget SpecialMenuModel(){
  return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cardMenu(Color(0xffF5D4C1),Image.asset('lib/asset/image/taco.png')),
                  cardMenu(Color(0xffDED2F9),Image.asset('lib/asset/image/con.png',cacheHeight: 140,)),
                  cardMenu(Color(0xffD0F1EB),Image.asset('lib/asset/image/burger.png',)),
                ],
              ),
            );
}