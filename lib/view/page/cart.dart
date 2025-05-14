import 'package:Food_Khan/model/provider/add_cart.dart';
import 'package:Food_Khan/widget/page/cart/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context,listen: false);
    return Scaffold(

      backgroundColor: const Color(0xff191D21),
      appBar: AppBar(
        backgroundColor: const Color(0xff191D21),
        toolbarHeight: 30,
        elevation: 0,
        title: const Text(
          "Your Favorite Food Cart",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Consumer<CartController>(
        builder:
            (context, provider, child) => Column(
              children: [
                const SizedBox(height: 15),
                IconButton(onPressed: (){
                  Get.snackbar('All Favorite Item Clear', 'Add item to cart the it will appare here',backgroundColor: Colors.red,snackPosition: SnackPosition.BOTTOM);
                  cart.clearCart();
                }, icon: Icon(Icons.cleaning_services_rounded,size: 35,color: Colors.white,)),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.cart.length,
                    itemBuilder: (context, index) {
                      return CartDemo(item: provider.cart[index]);
                    },
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
