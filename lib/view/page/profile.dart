import 'package:Food_Khan/model/routes/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final String fullName;
  final String country;
  final String phone;

  const ProfileScreen({
    super.key,
    required this.fullName,
    required this.country,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile Information'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileItem(label: "Full Name", value: fullName),
            SizedBox(height: 16),
            ProfileItem(label: "Country", value: country),
            SizedBox(height: 16),
            ProfileItem(label: "Mobile Number", value: phone),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pinkAccent,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Thank you for providing your information!',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(onPressed: (){
              Get.to(()=>NavigationControll());
            }, icon: Icon(Icons.home, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
