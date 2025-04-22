import 'package:Food_Khan/view/page/home.dart';
import 'package:Food_Khan/view/page/location.dart';
import 'package:Food_Khan/view/page/order.dart';
import 'package:Food_Khan/view/page/profile.dart';
import 'package:flutter/material.dart';

class NavigationControll extends StatefulWidget {
  const NavigationControll({super.key});

  @override
  State<NavigationControll> createState() => _NavigationControllState();
}

class _NavigationControllState extends State<NavigationControll> {
  int onpageindex = 0; //? Where to index start
  final pagedata = [
    const Home(),
    const LocationScreen(),
    const Order(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191D21),
      body: pagedata[onpageindex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: onpageindex,
        onTap: (gotopage) {
          setState(() {
            onpageindex = gotopage;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff191D21),
        elevation: 0,
        showSelectedLabels: true,
        selectedItemColor: Color(0xffFFAC4B),
        unselectedItemColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 8,
        iconSize: 19,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bakery_dining_rounded),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
