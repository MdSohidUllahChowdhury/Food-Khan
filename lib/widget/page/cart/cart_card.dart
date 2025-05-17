import 'package:Food_Khan/model/page/order/food_menu_model.dart';
import 'package:Food_Khan/controller/provider/add_cart.dart';
import 'package:Food_Khan/view/page/food_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartDemo extends StatelessWidget {
  const CartDemo({super.key, required this.item});

  final FoodMenuModel item;

  @override
  Widget build(BuildContext context) {
    final providerCall = Provider.of<CartController>(context, listen: false);
    return InkWell(
      onTap:
          () => Get.to(() => FoodDetaills(product: item)),
      child: Animate(
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(12),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.grey.shade400,
                blurStyle: BlurStyle.outer,
                offset: const Offset(1, 3),
              ),
            ],
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(item.image.toString()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    item.name.toString().toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Bold',
                      letterSpacing: 1.3,
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  Text(
                    'PRICE :  ${item.price.toString()}',
                    style: const TextStyle(
                      fontFamily: 'Bold',
                      fontSize: 12,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xff191D21),
                child: IconButton(onPressed: (){
                  Get.snackbar("Deleted", "Your Item has been deleted",backgroundColor: Colors.white, );
                  providerCall.removeFromCart(item);
                }, icon: Icon(Icons.delete_outline,color: Colors.red,)),
              )
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
