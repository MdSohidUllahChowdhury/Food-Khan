import 'dart:collection';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_khan/model/screens/home/special_menu/menu_model.dart';
import 'package:food_khan/controller/supabase/cart_service.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  CartController({CartService? cartService, FirebaseAuth? auth})
    : _cartService = cartService ?? CartService(),
      _auth = auth ?? FirebaseAuth.instance {
    _authSubscription = _auth.authStateChanges().listen((user) {
      if (user == null) {
        _cart.clear();
        _errorMessage = null;
        _isLoading = false;
        notifyListeners();
        return;
      }

      loadCart();
    });
  }

  final CartService _cartService;
  final FirebaseAuth _auth;
  late final StreamSubscription<User?> _authSubscription;

  final List<MenuInfo> _cart = [];
  final Set<String> _busyItems = <String>{};
  bool _isLoading = false;
  String? _errorMessage;

  UnmodifiableListView<MenuInfo> get cart => UnmodifiableListView(_cart);
  UnmodifiableListView<MenuInfo> get callingCart => UnmodifiableListView(_cart);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  bool isInCart(String menuId) {
    return _cart.any((item) => item.id == menuId);
  }

  bool isItemBusy(String menuId) {
    return _busyItems.contains(menuId);
  }

  Future<void> loadCart({bool showLoading = true}) async {
    final user = _auth.currentUser;
    if (user == null) {
      _cart.clear();
      _errorMessage = null;
      _isLoading = false;
      notifyListeners();
      return;
    }

    if (showLoading) {
      _isLoading = true;
      notifyListeners();
    }

    try {
      final items = await _cartService.fetchCartItems();
      _cart
        ..clear()
        ..addAll(items);
      _errorMessage = null;
    } catch (error) {
      _errorMessage = _friendlyError(error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addToCart(MenuInfo item, {int quantity = 1}) async {
    _busyItems.add(item.id);
    notifyListeners();

    try {
      await _cartService.addToCart(item, quantity: quantity);
      await loadCart(showLoading: false);
    } catch (error) {
      _errorMessage = _friendlyError(error);
      notifyListeners();
      rethrow;
    } finally {
      _busyItems.remove(item.id);
      notifyListeners();
    }
  }

  Future<void> adtoCart(MenuInfo item, {int quantity = 1}) {
    return addToCart(item, quantity: quantity);
  }

  Future<void> removeFromCart(MenuInfo item) {
    return removeByMenuId(item.id);
  }

  Future<void> removeByMenuId(String menuId) async {
    _busyItems.add(menuId);
    notifyListeners();

    try {
      await _cartService.removeFromCart(menuId);
      _cart.removeWhere((item) => item.id == menuId);
      _errorMessage = null;
    } catch (error) {
      _errorMessage = _friendlyError(error);
      rethrow;
    } finally {
      _busyItems.remove(menuId);
      notifyListeners();
    }
  }

  Future<void> clearCart() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _cartService.clearCart();
      _cart.clear();
      _errorMessage = null;
    } catch (error) {
      _errorMessage = _friendlyError(error);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _friendlyError(Object error) {
    if (error is StateError) {
      return error.message.toString();
    }

    return 'Cart sync failed. Please try again.';
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}
