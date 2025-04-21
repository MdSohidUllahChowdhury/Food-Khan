import 'package:flutter/material.dart';

class FoodMenuModel {
  String? id;
  String? name;
  String? price;
  String? image;
  Color? color;

  FoodMenuModel({
    this.id, 
    required this.name, 
    required this.price, 
    required this.image, 
    this.color});
}
