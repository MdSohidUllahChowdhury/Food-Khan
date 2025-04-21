import 'package:application_backend/screen/page/home.dart';
import 'package:application_backend/screen/page/location.dart';
import 'package:application_backend/screen/page/order.dart';
import 'package:application_backend/screen/page/profile.dart';
import 'package:flutter/material.dart';


class NavigationControll extends StatefulWidget {
  const NavigationControll({super.key});
  
  @override
  State<NavigationControll> createState() => _NavigationControllState();
}

class _NavigationControllState extends State<NavigationControll> {
 
  int onpageindex = 0; //? Where to index start 
  final pagedata =[
    const Home(),
    const LocationScreen(),
    const Order(),
    const Profile()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191D21),
      body: pagedata[onpageindex],
      
      bottomNavigationBar: BottomNavigationBar(  
        currentIndex: onpageindex,
        onTap: (gotopage){
          setState(() {
            onpageindex = gotopage;
          });
         }, 
        type: BottomNavigationBarType.fixed,
        backgroundColor:const Color(0xff191D21),
        elevation:0,
        showSelectedLabels: true,
        selectedItemColor: Color(0xffFFAC4B),
        unselectedItemColor: Colors.white,
        selectedFontSize:10,
        unselectedFontSize:8,
        iconSize: 18,


        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'Home',
            ),
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