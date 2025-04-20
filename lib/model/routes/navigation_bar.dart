import 'package:application_backend/screen/home.dart';
import 'package:application_backend/screen/order.dart';
import 'package:application_backend/screen/profile.dart';
import 'package:flutter/material.dart';


class NavigationControll extends StatefulWidget {
  const NavigationControll({super.key});
  
  @override
  State<NavigationControll> createState() => _NavigationControllState();
}

class _NavigationControllState extends State<NavigationControll> {
 
  int onpageindex = 1; //? Where to index start 
  final pagedata =[const Home(),const Order(),const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pagedata[onpageindex],

       bottomNavigationBar: 
       BottomNavigationBar(
        currentIndex: onpageindex,
        onTap: (gotopage){
          setState(() {
            onpageindex = gotopage;
          });
         }, 
        backgroundColor: Color(0xff191D21),
        elevation:0,
        showSelectedLabels: true,
        selectedItemColor: Color(0xffFFAC4B),
        unselectedItemColor: Colors.white,

        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'Home',
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