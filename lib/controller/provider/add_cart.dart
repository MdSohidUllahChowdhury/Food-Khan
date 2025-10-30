import 'dart:collection';
import 'package:food_khan/database/special_menu/menu_model.dart';
import 'package:food_khan/model/screens/order/food_menu_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final List<MenuInfo> cart = [];
  UnmodifiableListView get callingCart => UnmodifiableListView(cart);

  void adtoCart(MenuInfo item) {
    cart.add(item);
    notifyListeners(); 
  }

  void removeFromCart(MenuInfo item) {
    cart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
