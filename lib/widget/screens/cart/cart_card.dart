import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_khan/model/screens/home/special_menu/menu_model.dart';
import 'package:food_khan/controller/provider/cart_provider.dart';
import 'package:food_khan/view/screens/order/food_details/food_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartDemo extends StatelessWidget {
  const CartDemo({super.key, required this.item});

  final MenuInfo item;

  @override
  Widget build(BuildContext context) {
    final providerCall = Provider.of<CartController>(context, listen: false);
    return InkWell(
      onTap: () => Get.to(() => FoodDetaills(product: item)),
      child: Animate(
        child: Container(
          height: MediaQuery.of(context).size.height * .15,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xff191D21)
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
                    item.name.toString(),
                    style: const TextStyle(
                      fontFamily: 'Bold',
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10),
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
                      Container(
                        height: MediaQuery.of(context).size.height * .040,
                        width: MediaQuery.of(context).size.width * .22,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red, width: 1),
                        ),

                        child: Center(
                          child: Text(
                            'Order',
                            style: TextStyle(
                              fontFamily: 'Bold',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*.18,),
                      IconButton(
                        onPressed: () {
                          Get.snackbar(
                            "Deleted",
                            "Your Item has been deleted",
                            backgroundColor: Colors.white,
                          );
                          providerCall.removeFromCart(item);
                        },
                        icon: Icon(FontAwesomeIcons.solidTrashCan,size: 14,color:Colors.red),
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
      ),
    );
  }
}
