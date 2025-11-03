import 'package:flutter/material.dart';
import 'package:food_khan/model/screens/home/special_menu/menu_model.dart';
import 'package:food_khan/controller/supabase/service_file.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  final SupabaseService _service = SupabaseService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MenuInfo>>(
      future: _service.fetcTodatSpecialMenu(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final users = snapshot.data ?? [];
        if (users.isEmpty) {
          return const Center(child: Text('No users found'));
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: user.background_color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.19,
                      child: Image(image: NetworkImage(user.imageUrl)),
                    ),

                    Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orangeAccent, size: 12),
                        SizedBox(width: 3),
                        Text(
                          user.rating.toString(),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.local_offer_rounded,
                          color: Colors.red,
                          size: 12,
                        ),
                        SizedBox(width: 3),
                        Text(
                          user.discount.toString(),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ),
                       
                      ],
                    ),
                    SizedBox(height: 10),
                    
                    Row(
                      children: [
                        Text(
                          'Food Type',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.menu_book_rounded,
                          color: Colors.black,
                          size: 10,
                        ),
                        SizedBox(width: 3),
                        Text(
                          user.category.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 23),
                         
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
