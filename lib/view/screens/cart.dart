import 'package:food_khan/controller/provider/add_cart.dart';
import 'package:food_khan/widget/screens/cart/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final cart = Provider.of<CartController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff191D21),
        toolbarHeight: 30,
        elevation: 0,
        title: const Text(
          "Your Food Cart",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 40,
            child: IconButton(
              onPressed: () {
               AlertDialog(actions: [
                Text("Shakil Chowdhury")
               ],);
                Get.snackbar(
                  'All Favorite Item Clear',
                  'Add item to cart the it will appare here',
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP
                );
                cart.clearCart();
              },
              icon: Icon(
                FontAwesomeIcons.solidTrashCan,
                size: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),

      body: Consumer<CartController>(
        builder:
            (context, provider, child) => Column(
              children: [
                const SizedBox(height: 15),

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
