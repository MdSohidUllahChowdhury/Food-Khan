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
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),

      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15,horizontal: 13),
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
              'User Information',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w100,
                letterSpacing: 1.2,
                //color: Color(0xff191D21),
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                ),
                prefixIcon: Icon(
                  Icons.email,
                  size: 18,
                  color: Colors.orange,
                ),
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Color(0xff656F77),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                ),
                prefixIcon: Icon(
                  Icons.phone,
                  size: 18,
                  color: Colors.orange,
                ),
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Color(0xff656F77),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Address',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                ),
                prefixIcon: Icon(
                  Icons.location_on,
                  size: 18,
                  color: Colors.orange,
                ),
                contentPadding: EdgeInsets.only(left: 10),
                fillColor: Color(0xff656F77),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
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
        },
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.save),
      ),
      

    );
  }
}