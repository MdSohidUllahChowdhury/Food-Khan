import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:glass_kit/glass_kit.dart';

Widget Food_DP(String foodImage,) {
  return GlassContainer(
    height: 220,
    width: 400,
    gradient: LinearGradient(
      colors: [Colors.white.withOpacity(0.40), Colors.white.withOpacity(0.10)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderGradient: LinearGradient(
      colors: [
        Colors.white.withOpacity(0.60),
        Colors.white.withOpacity(0.10),
        Colors.lightBlueAccent.withOpacity(0.05),
        Colors.lightBlueAccent.withOpacity(0.6),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 0.39, 0.40, 1.0],
    ),
    blur: 15.0,
    borderWidth: 1.5,
    elevation: 3.0,
    isFrostedGlass: true,
    shadowColor: Colors.black.withOpacity(0.20),
    alignment: Alignment.center,
    frostedOpacity: 0.12,
    margin: EdgeInsets.all(8.0),
    padding: EdgeInsets.all(8.0),
    child: Animate(
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(-6, 8),
            ),
          ],
          //color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(foodImage, cacheHeight: 210),
      ),
    ).animate().flipH(duration: Duration(seconds: 2)),
  );
}
