import 'package:food_khan/view/screens/cart.dart';
import 'package:food_khan/view/screens/home.dart';
import 'package:food_khan/view/screens/order.dart';
import 'package:food_khan/view/screens/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigationControll extends StatefulWidget {
  const NavigationControll({super.key});

  @override
  State<NavigationControll> createState() => _NavigationControllState();
}

class _NavigationControllState extends State<NavigationControll> {
  int onpageindex = 0;
  final pagedata = [
    const Home(),
    const Order(),
    const CartScreen(),
    const Profile(),
  ];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191D21),
      body: pagedata[onpageindex],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.home, size: 30),
          Icon(Icons.fastfood, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (gotopage) {
          setState(() {
            onpageindex = gotopage;
          });
        },
        backgroundColor: Colors.transparent,
        color: Color(0xffD0F1EB), // Use a single color instead of a gradient
        height: 65,
      ),
    );
  }
}
