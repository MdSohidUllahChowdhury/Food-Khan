import 'package:Food_Khan/model/provider/add_cart.dart';
import 'package:Food_Khan/widget/page/cart/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
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
      // body: 
      body: Consumer<CartController>(
          builder: (context, provider, child) => Column(
                children: [
                  //Utils.appbarCustom('Cart Iteams'),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                        itemCount: provider.cart.length,
                        itemBuilder: (context, index) {
                          return CartDemo(item: provider.cart[index]);
                        }),
                  )
                ],
              )),
    );
  }
}
