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
          height: 120,
          width: 120,
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Row(
            children: [
              Image.network(
                item.imageUrl.toString(),
                height: 110,
                width: 120,
                fit: BoxFit.fill,
              ),
              const SizedBox(width:20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name.toString().toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Bold',
                      letterSpacing: 1.3,
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  //SizedBox(width: 40,height: 30,),
                  SizedBox(height: 10),
                  Text(
                    'PRICE :  ${item.price.toString()}',
                    style: TextStyle(
                      fontFamily: 'Bold',
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                radius:20,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    Get.snackbar(
                      "Deleted",
                      "Your Item has been deleted",
                      backgroundColor: Colors.white,
                    );
                    providerCall.removeFromCart(item);
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent[700],
                  ),
                ),
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
