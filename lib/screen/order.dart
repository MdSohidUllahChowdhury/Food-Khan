import 'package:application_backend/widget/order/bar_section.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191D21),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              BarSection(),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height:213 ,
                    width: 168.5,
                    decoration: BoxDecoration(
                      color: Color(0xffF5D4C1),
                      borderRadius: BorderRadius.circular(16)
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 13),
                    height:213 ,
                    width: 168.5,
                    decoration: BoxDecoration(
                      color: Color(0xffFDEBC9),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(alignment: Alignment.topCenter,
                          child: Text("Pizza",style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.bold

                          ),)),
                        //const SizedBox(height: 8,),
                        SizedBox(height: 28,width: 60,
                          child: Align(alignment: Alignment.topCenter,
                            child: Chip(
                              label: Text("12\$",style: TextStyle(fontSize: 11),),
                              clipBehavior: Clip.hardEdge,
                              backgroundColor: Colors.white,
                              labelStyle: TextStyle(color: Colors.black),
                              ),
                          ),
                        ),
                        
                        Image.asset('lib/asset/image/pic_02.png',)
                      ],
                    ),

                  )
                ],
              )
            ],
        ),
      ),
    );
  }
}
