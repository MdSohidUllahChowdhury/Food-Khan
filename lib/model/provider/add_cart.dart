import 'dart:collection';
import 'package:Food_Khan/model/page/order/food_menu_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final List<FoodMenuModel> _cart = [];
  UnmodifiableListView get callingCart => UnmodifiableListView(_cart);

  void adtoCart(FoodMenuModel item) {
    _cart.add(item);
    notifyListeners(); 
  }

  void removeFromCart(FoodMenuModel item) {
    _cart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
