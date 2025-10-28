import 'package:food_khan/database/special_menu/menu_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient client = Supabase.instance.client;

  Future<List<MenuInfo>> fetchUsers() async {
    final response = await client.from('today_special_menu').select().order('created_at', ascending: false);

    // Debug print (you can remove later)
    print('Raw Supabase response: $response');

    // Cast to list
    final List<dynamic> data = response;
    return data.map((e) => MenuInfo.fromJson(e)).toList();
  }
}