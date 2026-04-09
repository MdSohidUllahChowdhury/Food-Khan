import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_khan/model/screens/home/special_menu/menu_model.dart';
import 'package:food_khan/controller/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_khan/view/screens/order/food_details/food_details.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  const CartCard({required this.item, super.key});

  final MenuInfo item;
  @override
  Widget build(BuildContext context) {
    final providerCall = Provider.of<CartController>(context, listen: false);
    return Animate(
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.black.withAlpha(70),
        ),
        child: Row(
          children: [
            Image.network(
              item.imageUrl.toString(),
              height: MediaQuery.of(context).size.height * .16,
              width: MediaQuery.of(context).size.width * .32,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name.toString().toUpperCase(),
                  style: const TextStyle(
                    fontFamily: 'Bold',
                    wordSpacing: 3,
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${item.price.toString()}',
                  style: TextStyle(
                    fontFamily: 'Bold',
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => FoodDetaills(product: item));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .040,
                        width: MediaQuery.of(context).size.width * .24,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black, width: .8),
                        ),

                        child: Center(
                          child: Text(
                            'ORDER NOW',
                            style: TextStyle(
                              fontFamily: 'beeno',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * .18),
                    IconButton(
                      onPressed: () {
                        Get.snackbar(
                          "Deleted",
                          "Your Item has been deleted",
                          backgroundColor: Colors.white,
                        );
                        providerCall.removeFromCart(item);
                      },
                      icon: Icon(
                        FontAwesomeIcons.solidTrashCan,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ).animate().flip().shimmer(
        color: Colors.white,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
