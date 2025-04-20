import 'package:application_backend/widget/home/featured.dart';
import 'package:flutter/material.dart';

Widget FeaturedRestaurantModel(){
  return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Fetured(Color(0xffFDEBC9), Image.asset('lib/asset/image/grill.png'))
                  ],
                ),
              );
}