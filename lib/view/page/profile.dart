import 'package:Food_Khan/model/routes/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191D21),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w100,
            letterSpacing: 1.4,
            color: Color(0xff191D21),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.to(
              () => NavigationControll(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.snackbar(
                'Development Mood',
                "Working on this unit"
                    " please be patient",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Color(0xffD0F1EB),
                colorText: Color(0xff191D21),
                duration: Duration(seconds: 4),
              );
              // Add your settings action here
            },
          ),
        ],
        backgroundColor: Color(0xffF24E1E),
        centerTitle: true,
      ),

      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Animate(
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/157578225?v=4',
                    ),
                  ),
                ),
              ),
            ).animate().flipH(duration: 500.ms).then().fadeIn(duration: 4000.ms),

            const SizedBox(height: 10),
            Text(
              'User Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                letterSpacing: 1.4,
                color: Color(0xff191D21),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}