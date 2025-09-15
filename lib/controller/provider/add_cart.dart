import 'dart:collection';
import 'package:food_khan/model/screens/order/food_menu_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final List<FoodMenuModel> cart = [];
  UnmodifiableListView get callingCart => UnmodifiableListView(cart);

  void adtoCart(FoodMenuModel item) {
    cart.add(item);
    notifyListeners(); 
  }

  void removeFromCart(FoodMenuModel item) {
    cart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
