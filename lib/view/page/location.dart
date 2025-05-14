// ignore_for_file: deprecated_member_use

import 'package:Food_Khan/widget/page/location/location_bar.dart';
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
      backgroundColor: Color(0xff191D21),
      body: Column(
        children: [
          LocationBarSection(),
          //const SizedBox(height: 20),
          // Animate(
          //   child: Container(
          //     height: 35,
          //     width: 250,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       color: Color(0xffC9EAFD),
          //       borderRadius: BorderRadius.circular(35),
          //     ),
          //     //margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 110),
          //     child: Text(
          //       'Food Khan Location on Google Maps',
          //       style: TextStyle(
          //         fontSize: 14,
          //         fontWeight: FontWeight.w100,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ).animate(delay: 900.ms, effects: [FadeEffect(duration: 500.ms)]).flipV(),
          const SizedBox(height: 40),
          Divider(color: Color(0xff42D674), thickness: 18),
          const SizedBox(height: 20),
          Divider(color: Color(0xffFFAC4B), thickness: 18),
          //const SizedBox(height: 30),
          const SizedBox(height: 40),
          
          AvatarGlow(
              startDelay: const Duration(milliseconds: 1000),
              glowColor: Colors.white,
              glowShape: BoxShape.circle,
              //animate: _animate,
              curve: Curves.slowMiddle,
              child: const Material(
                //elevation: 3.0,
                shape: CircleBorder(),
                color: Colors.transparent,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    'https://www.creativefabrica.com/wp-content/uploads/2020/10/16/SVG-Business-GPS-Flat-Icon-Vector-Graphics-6104460-2-580x435.png',
                  ),
                  radius: 70.0,
                ),
              ),
            ),
          
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
