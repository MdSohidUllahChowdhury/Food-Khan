import 'package:Food_Khan/view/page/food_details.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:Food_Khan/model/page/order/food_menu_model.dart';
import 'package:Food_Khan/model/page/order/food_model_list.dart';
import 'package:Food_Khan/view/page/order.dart';
import 'package:Food_Khan/view/page/bio_info.dart';
import 'package:Food_Khan/widget/styel/styel.dart';
import 'package:Food_Khan/model/page/home/categories.dart';
import 'package:Food_Khan/model/page/home/fetured_restaurant.dart';
import 'package:Food_Khan/model/page/home/special_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final TextEditingController searchController = TextEditingController();
  List<FoodMenuModel> filteredProducts = [];

  void filterProducts() {
    final query = searchController.text.toLowerCase().trim();
    if (query.isEmpty) {
      setState(() {
        filteredProducts = [];
      });
    } else {
      setState(() {
        filteredProducts =
            foodMenuList.where((product) {
              return product.name!.toLowerCase().contains(query);
            }).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterProducts();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            //*** Header Row with profile and search box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Get.to(() =>  BioFormScreen()),
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/157578225?v=4',
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        hintText: 'Search Food Items...',
                        hintStyle: const TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 26,
                          color: Colors.orange,
                        ),
                        filled: true,
                        fillColor: const Color(0xff656F77),
                        border: OutlineInputBorder(
                          gapPadding: 12,
                          borderRadius: BorderRadius.circular(26),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            //*** Search result section
            if (searchController.text.trim().isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Text("Search Results", style: CustomTextStyle.title),
                    filteredProducts.isEmpty
                        ? const Text(
                          "No products found",
                          style: TextStyle(color: Colors.white),
                        )
                        : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 50,
                                child: Image(
                                  image: AssetImage(product.image ?? ''),
                                ),
                              ),
                              subtitle: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  product.name ?? "",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.to(
                                 ()=> FoodDetaills(
                                    product: filteredProducts[index],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),
            Text("  Popular categories", style: CustomTextStyle.title),
            CategoriModel(),

            const SizedBox(height: 20),
            Text("  Today’s special menu", style: CustomTextStyle.title),
            InkWell(
              onTap: () => Get.to(() => const Order()),
              child: SpecialMenuModel(),
            ),

            const SizedBox(height: 20),
            Text("  Featured restaurants", style: CustomTextStyle.title),
            FeaturedRestaurantModel(),
          ],
        ),
      ),
    );
  }
}
