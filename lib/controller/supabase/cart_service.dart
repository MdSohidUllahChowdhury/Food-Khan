import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_khan/model/screens/home/special_menu/menu_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

/// Expected `cart_table` columns:
/// user_id, user_email, menu_id, name, image_url, price, rating, discount,
/// category, background_color, quantity, created_at, updated_at
class CartService {
  CartService({FirebaseAuth? auth, SupabaseClient? client})
    : _auth = auth ?? FirebaseAuth.instance,
      _client = client ?? Supabase.instance.client;

  static const String _tableName = 'cart_table';

  final FirebaseAuth _auth;
  final SupabaseClient _client;

  User _requireUser() {
    final user = _auth.currentUser;
    if (user == null) {
      throw StateError('Please log in first to use the cart.');
    }

    return user;
  }

  Future<List<MenuInfo>> fetchCartItems() async {
    final user = _requireUser();
    final response = await _client
        .from(_tableName)
        .select()
        .eq('user_id', user.uid)
        .order('updated_at', ascending: false);

    final data = List<Map<String, dynamic>>.from(response);
    return data.map(MenuInfo.fromCartJson).toList();
  }

  Future<void> addToCart(MenuInfo item, {int quantity = 1}) async {
    final user = _requireUser();

    final existingItem =
        await _client
            .from(_tableName)
            .select('quantity')
            .eq('user_id', user.uid)
            .eq('menu_id', item.id)
            .maybeSingle();

    final currentQuantity =
        existingItem == null
            ? 0
            : (existingItem['quantity'] as num?)?.toInt() ?? 0;

    await _client
        .from(_tableName)
        .upsert(
          item.toCartJson(
            userId: user.uid,
            userEmail: user.email,
            quantity: currentQuantity + quantity,
          ),
          onConflict: 'user_id,menu_id',
        );
  }

  Future<void> removeFromCart(String menuId) async {
    final user = _requireUser();

    await _client
        .from(_tableName)
        .delete()
        .eq('user_id', user.uid)
        .eq('menu_id', menuId);
  }

  Future<void> clearCart() async {
    final user = _requireUser();
    await _client.from(_tableName).delete().eq('user_id', user.uid);
  }
}
