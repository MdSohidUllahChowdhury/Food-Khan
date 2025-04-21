import 'package:application_backend/model/home/categories.dart';
import 'package:application_backend/model/home/fetured_restaurant.dart';
import 'package:application_backend/model/home/special_menu.dart';
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
                  backgroundImage: NetworkImage(
                    "https://scontent.fdac22-1.fna.fbcdn.net/v/t39.30808-6/462224242_3848408458768924_2899989875015698060_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGBlZGTJXQU3jzc3PgTVMEyvUlQmy-VouS9SVCbL5Wi5Nmzh0ObK35b-loRMY7cfVxwu6f-if5-u3NDWYUTvDWw&_nc_ohc=YbnoF6_6dx0Q7kNvwE_Qn-O&_nc_oc=AdkQpinV_bTcRwYsMRtn3Aek9sNCvEr-WUxu7n0ajypPMh_42vkAynJLtvCYRoLI7BQ&_nc_zt=23&_nc_ht=scontent.fdac22-1.fna&_nc_gid=47vBCBOVpvHlCmk98FQHOw&oh=00_AfEs0d8X55ZPf27kZrxuPgCpqD_5ti4-4WiaTrjMWVTGxA&oe=6806BAE3",
                  ),
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