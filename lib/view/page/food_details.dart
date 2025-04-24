import 'package:Food_Khan/model/routes/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class FoodDetaills extends StatefulWidget {

  const FoodDetaills({
    
    super.key,
    String? foodName,
    String? foodPrice,
    String? foodImage,
    Color? foodColor,
  });

  @override
  State<FoodDetaills> createState() => _FoodDetaillsState();
}

class _FoodDetaillsState extends State<FoodDetaills> {
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
            Get.to(()=> const NavigationControll(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 500));
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
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const SizedBox(height: 10),
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage(
                    "lib/asset/image/pic_03.png",
                  ), // Replace with your food image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 35),
           
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  radius: 35,
                  backgroundColor: const Color(0xffF24E1E),
                  child: Center(
                    child: IconButton(onPressed: (){}, icon:Icon(Icons.favorite, color: Colors.black, size: 44,)),
                  ),
                ),
              ],
            ),


            const SizedBox(height: 20),
            Container(
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
                  const Text(
                    "The Taco Truck",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Mexican food truck serving tacos, burritos, and quesadillas.The Taco Truck is a popular food truck that serves delicious Mexican cuisine.",
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
            const SizedBox(height: 20),

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
                      backgroundColor: const Color(0xff42D674),
                      child: Center(
                        child: const Text(
                          "  Price\n\$12.99",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ).animate().flip().scaleXY(duration: 500.ms).then().fadeIn(duration: 4000.ms),
                ElevatedButton(
                  onPressed: () {},
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
