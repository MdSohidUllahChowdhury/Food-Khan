import 'package:Food_Khan/model/routes/navigation_bar.dart';
import 'package:Food_Khan/view/page/wallet.dart';
import 'package:Food_Khan/widget/page/food_detaills/food_dp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class FoodDetaills extends StatefulWidget {
  final String productImage, brandName, offerPrice;
  const FoodDetaills({
    super.key,
    required this.productImage,
    required this.brandName,
    required this.offerPrice,
  });

  @override
  State<FoodDetaills> createState() => _FoodDetaillsState();
}

class _FoodDetaillsState extends State<FoodDetaills> {
  int quantity = 1;
  int price = 0;

  @override
  void initState() {
    price = int.parse(widget.offerPrice.replaceAll('\$', ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191D21),
      appBar: AppBar(
        backgroundColor: const Color(0xff191D21),
        toolbarHeight: 30,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Get.to(
              () => const NavigationControll(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 500),
            );
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Food_DP(widget.productImage),
            const SizedBox(height: 35),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "ADD TO FAVORITE",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xffF24E1E),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Color(0xff191D21),
                        size: 44,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
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
                    color: const Color.fromARGB(
                      255,
                      240,
                      206,
                      206,
                    ).withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(-6, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.brandName,
                    style: TextStyle(
                      fontSize: 20,
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
                  Divider(color: Color(0xff42D674), thickness: 18),
                  const SizedBox(height: 10),
                  Divider(color: Color(0xffffffff), thickness: 18),
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
                    backgroundColor: Color(0xffF7C242),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          quantity = quantity + 1;
                          price = quantity * int.parse(widget.offerPrice.replaceAll('\$', ''));
                        });
                      },
                      icon: Icon(Icons.add, color: Color(0xff191D21), size: 25),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xffF7C242),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xffF7C242),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity = quantity - 1;
                            price = quantity * int.parse(widget.offerPrice.replaceAll('\$', ''));
                          }
                        });
                      },
                      icon: Icon(Icons.remove, color: Color(0xff191D21), size: 25),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Animate(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color(0xffffffff),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: const Color(0xff8ACCD5),
                      child: Center(
                        child: Text(
                          '\$$price',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.black87,
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
                    .fadeIn(duration: 2000.ms),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const Wallet());
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
                  child: Text(
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