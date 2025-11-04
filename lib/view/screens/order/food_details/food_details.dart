import 'package:food_khan/model/screens/home/special_menu/menu_model.dart';
import 'package:food_khan/controller/provider/cart_provider.dart';
import 'package:food_khan/view/screens/order/payment/delivery_info.dart';
import 'package:food_khan/widget/screens/order/food_detaills/food_dp.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FoodDetaills extends StatefulWidget {
  final MenuInfo product;
  const FoodDetaills({super.key, required this.product});

  @override
  State<FoodDetaills> createState() => _FoodDetaillsState();
}

class _FoodDetaillsState extends State<FoodDetaills> {
  int quantity = 1;
  int price = 0;
  bool fill = false;

  @override
  void initState() {
    super.initState();
    price = int.parse(widget.product.price.toString().replaceAll('\$', ''));
  }

  @override
  Widget build(BuildContext context) {
    final providerCall = Provider.of<CartController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 33,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.solidArrowAltCircleLeft,
            size: 24,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Food Details",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 22, left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Food_DP(widget.product.imageUrl),
            const SizedBox(height: 15),

            //* Favorite Button and add to Cart 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add to Favorite",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                AvatarGlow(
                  duration: Duration(seconds: 2),
                  repeat: false,
                  child: Material(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: widget.product.background_color ?? Colors.white,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              fill = !fill;
                              if (fill) {
                                Get.snackbar(
                                  'Added to Favorite',
                                  'Successfully Added',
                                  backgroundColor: Colors.white,
                                  snackPosition: SnackPosition.TOP,
                                );
                                providerCall.adtoCart(widget.product);
                              } else {
                                Get.snackbar(
                                  'Removed from Favorite',
                                  'Successfully Removed',
                                  backgroundColor: Colors.white,
                                  snackPosition: SnackPosition.TOP,
                                );
                                providerCall.removeFromCart(widget.product);
                              }
                            });
                          },
                          child: Icon(
                            fill ? Icons.favorite : Icons.favorite_border,
                            color: fill ? Colors.red : Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),

            //* Product Name and Description
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff191D21),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name.toString().toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Color(0xffffffff), thickness: 8),
                  const SizedBox(height: 10),
                  const Text(
                    "Mexican food truck serving tacos, burritos, and quesadillas. The Taco Truck is a popular food truck that serves delicious Mexican cuisine.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Color(0xff42D674), thickness: 5),
                  const Divider(color: Color(0xffffffff), thickness: 5),
                ],
              ),
            ),
            
            //* Qunatity Up and Down + -
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                            price =
                                quantity *
                                int.parse(
                                  widget.product.price.toString().replaceAll(
                                    '\$',
                                    '',
                                  ),
                                );
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Color(0xff191D21),
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 20),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xff42D674),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                          price =
                              quantity *
                              int.parse(
                                widget.product.price.toString().replaceAll(
                                  '\$',
                                  '',
                                ),
                              );
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xff191D21),
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            //** Price and Order Now Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Animate(
                      child: CircleAvatar(
                        radius: 33,
                        backgroundColor: Colors.greenAccent,
                        child: CircleAvatar(
                          radius: 31,
                          backgroundColor:
                              Colors.grey[900], //const Color(0xff8ACCD5),
                          child: Center(
                            child: Text(
                              '\$$price',
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .animate()
                    .flipV()
                    .scaleXY(duration: 500.ms)
                    .then()
                    .fadeIn(duration: 1000.ms),
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => DeliveryCheckOut(totalPrice: price.toString(),foodName: widget.product.name,foodQuantity: quantity.toString(),),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.product.background_color,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 90,
                      vertical: 22,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: const Text(
                    'ORDER NOW',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:15),
          ],
        ),
      ),
    );
  }
}
