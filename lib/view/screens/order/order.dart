import 'package:food_khan/database/service/service_file.dart';
import 'package:food_khan/database/special_menu/menu_model.dart';

import 'package:food_khan/view/screens/order/food_details/food_details.dart';
import 'package:food_khan/widget/screens/order/bar_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

final SupabaseService _service = SupabaseService();


class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BarSection(),
          Expanded(
            child: FutureBuilder<List<MenuInfo>>(
              future: _service.fetchUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final items = snapshot.data ?? [];
                if (items.isEmpty) {
                  return const Center(child: Text('No items found'));
                }

                return GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.70,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    // Use the item directly since FoodDetaills now accepts MenuInfo
                    return InkWell(
                      onTap: () => Get.to(() => FoodDetaills(product: item)),
                      child: Container(
                        margin: const EdgeInsets.only(top: 6, left: 4, right: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: item.background_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: double.infinity,
                              child:
                                  item.imageUrl.isNotEmpty
                                      ? Image.network(
                                        item.imageUrl,
                                        //fit: BoxFit.cover,
                                      )
                                      : const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  item.rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Icon(
                                  Icons.local_offer_rounded,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  item.discount.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Text(
                                  'Food Type',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.menu_book_rounded,
                                  color: Colors.black,
                                  size: 12,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  item.category.toString(),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
