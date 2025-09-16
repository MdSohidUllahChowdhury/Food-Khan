import 'package:food_khan/model/screens/order/food_model_list.dart';
import 'package:food_khan/view/screens/food_details.dart';
import 'package:food_khan/widget/screens/order/bar_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

final _foodCall = foodMenuList;

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [BarSection(), SizedBox(height: 20)],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.84, // Adjusted aspect ratio
              crossAxisSpacing: 8,
              mainAxisSpacing: 2,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              
              final item = _foodCall[index];
              return InkWell(
                onTap: () {
                  Get.to(() => FoodDetaills(product: _foodCall[index]));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 4, right: 4),
                  height: 213,
                  width: 168.5,
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          item.name.toString(),
                          style: TextStyle(
                            letterSpacing: 1.2,
                            //fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Chip(
                          label: Text(
                            item.price.toString(),
                            style: TextStyle(fontSize: 13,fontFamily: GoogleFonts.numans().fontFamily,fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      Image.asset(item.image.toString(), height: 120),
                    ],
                  ),
                ),
              );
            }, 
            childCount: _foodCall.length
            ),
          ),
        ],
      ),
    );
  }
}
