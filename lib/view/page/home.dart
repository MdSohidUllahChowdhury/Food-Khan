import 'package:Food_Khan/model/page/home/categories.dart';
import 'package:Food_Khan/model/page/home/fetured_restaurant.dart';
import 'package:Food_Khan/model/page/home/special_menu.dart';
import 'package:Food_Khan/model/page/order/food_menu_model.dart';
import 'package:Food_Khan/model/page/order/food_model_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //! Try to add search filter
  TextEditingController searchController = TextEditingController();
  List<FoodMenuModel> food = foodMenuList;
  //! ---------

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
                    'https://avatars.githubusercontent.com/u/157578225?v=4',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    //onChanged: searchFood,
                    autofocus: true,
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Dishes, restaurants or cuisines',
                      fillColor: Color(0xff656F77),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // SizedBox.expand(
                //   child: ListView.builder(
                //     itemCount: food.length,
                //     itemBuilder: (context, index) {
                //       final call = food[index];
                //       return ListTile(
                //         leading: Image.asset(
                //           call.image.toString(),
                //           height: 50,
                //           width: 50,
                //           fit: BoxFit.cover,
                //         ),
                //         title: Text(call.name.toString()),
                //       );
                //     },
                //   ),
                // )
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

  // void searchFood(String query) {
  //   final suggestion =
  //       foodMenuList.where((element) {
  //         final foodTittle = element.name.toString();
  //         final input = query.toLowerCase();
  //         return foodTittle.contains(input);
  //       }).toList();
  //   setState(() {
  //     food = suggestion;
  //   });
  // }
}
