import 'package:food_khan/controller/provider/cart_provider.dart';
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
        toolbarHeight: 100,
        elevation: 0,
        title: const Text(
          "Favorite Cart",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.snackbar(
                'All Favorite Item Clear',
                'Add item to cart the it will appare here',
                backgroundColor: Colors.red,
                snackPosition: SnackPosition.TOP,
              );
              cart.clearCart();
            },
            icon: Icon(
              FontAwesomeIcons.solidTrashCan,
              size: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
//backgroundColor: Colors.amber.shade600,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.amber.shade600,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(36),topRight: Radius.circular(36))
        ),
        child: Consumer<CartController>(
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
      ),
    );
  }
}
