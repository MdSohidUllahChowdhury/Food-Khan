// ignore_for_file: deprecated_member_use

import 'package:food_khan/widget/screens/location/location_bar.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final String googleMapsUrl =
      "https://www.google.com/maps/search/?api=1&query=23.781914961742824,90.42591531895101";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LocationBarSection(),
          const SizedBox(height: 40),
          Divider(color: Color(0xff42D674), thickness: 18),
          const SizedBox(height: 8),
          Divider(color: Color(0xffFFAC4B), thickness: 18),
          const SizedBox(height: 60),

          AvatarGlow(
            startDelay: const Duration(milliseconds: 1000),
            glowColor: Colors.white,
            glowShape: BoxShape.circle,
            curve: Curves.slowMiddle,
            child: Material(
              shape: CircleBorder(),
              color: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 80.0,
                child: Icon(
                  Icons.location_on_rounded,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),
          ),
          SizedBox(height: 70),
          ElevatedButton(
            onPressed: () async {
              if (await canLaunch(googleMapsUrl)) {
                await launch(googleMapsUrl);
              } else {
                throw 'Could not open Google Maps';
              }
            },
            child: Text('Open Google Maps'),
          ),
        ],
      ),
    );
  }
}
