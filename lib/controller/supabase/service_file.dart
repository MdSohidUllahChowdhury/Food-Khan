import 'package:food_khan/model/screens/home/featured_restaurant/restaurant_model.dart';
import 'package:food_khan/model/screens/home/special_menu/menu_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient client = Supabase.instance.client;

  Future<List<MenuInfo>> fetcTodatSpecialMenu() async {
    final response = await client
        .from('today_special_menu')
        .select()
        .order('created_at', ascending: false);
    //print('Raw Supabase response: $response');
    final List<dynamic> data = response;
    return data.map((e) => MenuInfo.fromJson(e)).toList();
  }

  Future<List<RestaurantModel>> fetchRestaurantInfo() async {
    final response = await client
        .from('featured_restaurent')
        .select()
        .order('created_at', ascending: false);
    //print('Raw Supabase response: $response');
    final List<dynamic> data = response;
    return data.map((e) => RestaurantModel.fromJson(e)).toList();
  }
}
