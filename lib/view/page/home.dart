import 'package:Food_Khan/model/page/home/categories.dart';
import 'package:Food_Khan/model/page/home/fetured_restaurant.dart';
import 'package:Food_Khan/model/page/home/special_menu.dart';
import 'package:Food_Khan/model/page/order/food_menu_model.dart';
import 'package:Food_Khan/model/page/order/food_model_list.dart';
import 'package:Food_Khan/view/page/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  List<FoodMenuModel> food = foodMenuList;
  List<FoodMenuModel> filteredFood = [];

  @override
  void initState() {
    super.initState();
    filteredFood = food; // Initialize with the full list
  }

  void searchFood(String query) {
    final suggestion =
        food.where((element) {
          final foodTitle = element.name.toString();
          final input = query.toString();
          return foodTitle.contains(input);
        }).toList();

    setState(() {
      filteredFood = suggestion;
    });
  }

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
                InkWell(onTap: () => Get.to(()=> const Profile()),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/157578225?v=4',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 38,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.only(left: 30),
                    child: TextFormField(
                      onChanged: searchFood, // Call the search function
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Dishes, restaurants or cuisines',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 12,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 18,
                          color: Colors.orange,
                        ),
                        contentPadding: EdgeInsets.only(left: 10),
                        fillColor: Color(0xff656F77),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(26)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              "  Search Results",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),

            filteredFood.isNotEmpty
                ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredFood.length,
                  itemBuilder: (context, index) {
                    final item = filteredFood[index];
                    return ListTile(
                      leading: Image.asset(
                        item.image.toString(),
                        height: 35,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        item.name.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    );
                  },
                )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "No items found",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
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
