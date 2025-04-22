import 'package:Food_Khan/model/page/home/categories.dart';
import 'package:Food_Khan/model/page/home/fetured_restaurant.dart';
import 'package:Food_Khan/model/page/home/special_menu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191D21),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 65),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 13),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/157578225?v=4'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Dishes, restaurants or cuisines',
                      fillColor: Color(0xff656F77),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              "  Popular categories",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            CategoriModel(),

            const SizedBox(height: 20),
            Text(
              "  Today’s special menu",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            SpecialMenuModel(),
            
            const SizedBox(height: 20),
            Text(
              "  Featured restaurants",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            FeaturedRestaurantModel(),
          ],
        ),
      ),

    );
  }
}