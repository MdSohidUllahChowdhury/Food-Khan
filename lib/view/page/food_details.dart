import 'package:Food_Khan/model/page/order/food_menu_model.dart';
import 'package:Food_Khan/controller/provider/add_cart.dart';
import 'package:Food_Khan/view/page/delivery.dart';
import 'package:Food_Khan/widget/page/food_detaills/food_dp.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FoodDetaills extends StatefulWidget {
  
  final FoodMenuModel product;
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
        backgroundColor:Colors.transparent,
        toolbarHeight: 30,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left, color: Colors.white,size: 33,),
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
            Food_DP(widget.product.image.toString()),
            const SizedBox(height: 15),
            
            //* Favorite Button and Cart Funcation Done this Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "ADD TO FAVORITE",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                AvatarGlow(
                  child: Material(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
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
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                                providerCall.adtoCart(widget.product);
                              } else {
                                Get.snackbar(
                                  'Removed from Favorite',
                                  'Successfully Removed',
                                  backgroundColor: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                                providerCall.removeFromCart(widget.product);
                              }
                            });
                          },
                          child: Icon(
                            fill ? Icons.favorite : Icons.favorite_border,
                            color: fill ? Colors.red : Colors.black,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

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
                    color: const Color.fromARGB(255, 240, 206, 206)
                        .withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(-6, 8),
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
                  const Text(
                    "Mexican food truck serving tacos, burritos, and quesadillas. The Taco Truck is a popular food truck that serves delicious Mexican cuisine.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Color(0xff42D674), thickness: 18),
                  const SizedBox(height: 10),
                  const Divider(color: Color(0xffffffff), thickness: 18),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffF7C242),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                          price = quantity *
                              int.parse(widget.product.price.toString()
                                  .replaceAll('\$', ''));
                        });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xff191D21), size: 25),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color(0xffF7C242),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 20),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffF7C242),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                            price = quantity *
                                int.parse(widget.product.price.toString()
                                    .replaceAll('\$', ''));
                          }
                        });
                      },
                      icon: const Icon(Icons.remove,
                          color: Color(0xff191D21), size: 25),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //** Order Now Button and Price 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Animate(
                  child: CircleAvatar(
                    radius: 39,
                    backgroundColor: const Color(0xffffffff),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: const Color(0xff8ACCD5),
                      child: Center(
                        child: Text(
                          '\$$price',
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ).animate().flipV().scaleXY(duration: 500.ms).then().fadeIn(duration: 1000.ms),
                ElevatedButton(
                  onPressed: () {
                  Get.to(()=>DeliveryCheckOut(totalPrice: price.toString(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
