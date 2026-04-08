import 'package:food_khan/controller/supabase/profile_image_service.dart';
import 'package:food_khan/model/screens/home/featured_restaurant/show_restaurant.dart';
import 'package:food_khan/model/screens/home/special_menu/menu_model.dart';
import 'package:food_khan/model/screens/home/special_menu/show_special_menu.dart';
import 'package:food_khan/view/screens/order/food_details/food_details.dart';
import 'package:food_khan/view/screens/order/order.dart';
import 'package:food_khan/view/screens/profile/change_pro_pic.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:food_khan/widget/style/styel.dart';
import 'package:food_khan/model/screens/home/categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();
  List<MenuInfo> filteredProducts = [];
  late final ValueNotifier<int> _refreshTrigger = ValueNotifier(0);
  String? _profileImageUrl;

  void filterProducts() {
    final query = searchController.text.toLowerCase().trim();
    if (query.isEmpty) {
      setState(() {
        filteredProducts = [];
      });
    } else {
      setState(() {
        filteredProducts =
            filteredProducts.where((product) {
              return product.name.toLowerCase().contains(query);
            }).toList();
      });
    }
  }

  Future<void> _fetchProfileImage() async {
    final url = await ProfileImageService().getUserProfileImageUrl();
    if (mounted) setState(() => _profileImageUrl = url);
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterProducts();
      _fetchProfileImage();
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
            //!! Header Row with profile and search box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => ProfileScreen(
                          onImageUpdated: (newUrl) {
                            //Instantly update without waiting for FutureBuilder to re-run
                            setState(() => _profileImageUrl = newUrl);
                          },
                        ),
                      )?.then((_) {
                        _refreshTrigger.value++;
                      });
                    },
                    child: ValueListenableBuilder<int>(
                      valueListenable: _refreshTrigger,
                      builder: (context, refreshCount, _) {
                        return FutureBuilder<String?>(
                          key: ValueKey(refreshCount),
                          future:
                              ProfileImageService().getUserProfileImageUrl(),
                          builder: (context, snapshot) {
                            final imageUrl = snapshot.data;

                            return Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 32,
                                  backgroundImage:
                                      imageUrl != null
                                          ? NetworkImage(imageUrl)
                                          : null,
                                  child:
                                      imageUrl == null
                                          ? const Icon(
                                            Icons.person,
                                            size: 50,
                                            color: Colors.white,
                                          )
                                          : null,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.orange.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    child: const Icon(
                                      Icons.edit,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        hintText: 'Search Food Items...',
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black,
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(
                          alpha: 0.8,
                        ), //const Color(0xff656F77),
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
                                  image: NetworkImage(
                                    product.imageUrl.trim().toString(),
                                  ),
                                ),
                              ),
                              subtitle: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  product.name.trim().toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.to(
                                  () => FoodDetaills(
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

            const SizedBox(height: 10),
            Text("  Popular Categories", style: CustomTextStyle.title),
            CategoriModel(),

            const SizedBox(height: 20),
            Text("  Today’s Special Menu", style: CustomTextStyle.title),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: InkWell(
                onTap: () => Get.to(() => Order()),
                child: ShowData(),
              ),
            ),

            const SizedBox(height: 20),
            Text("  Featured Restaurants", style: CustomTextStyle.title),
            SizedBox(height: 12),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.44,
              child: RestaurantInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
