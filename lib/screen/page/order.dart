import 'package:application_backend/model/order/food_model_list.dart';
import 'package:application_backend/widget/page/order/bar_section.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xff191D21),
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
              return Container(
                margin: EdgeInsets.only(top: 10, left: 4, right: 4),
                height: 213,
                width: 168.5,
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        item.name.toString(),
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Chip(
                        label: Text(
                          item.price.toString(),
                          style: TextStyle(fontSize: 10),
                        ),
                        backgroundColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    Image.asset(item.image.toString(), height: 100),
                  ],
                ),
              );
            }, childCount: _foodCall.length),
          ),
        ],
      ),
    );
  }
}
