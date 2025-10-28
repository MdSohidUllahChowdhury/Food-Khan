import 'package:flutter/material.dart';
import 'package:food_khan/database/featured_restaurant/restaurant_model.dart';
import 'package:food_khan/database/service/service_file.dart';

class RestaurantInfo extends StatefulWidget {
  const RestaurantInfo({super.key});

  @override
  State<RestaurantInfo> createState() => _RestaurantInfoState();
}

class _RestaurantInfoState extends State<RestaurantInfo> {
  final SupabaseService _service = SupabaseService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RestaurantModel>>(
      future: _service.fetchRestaurantInfo(),
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
          scrollDirection: Axis.vertical,
          itemCount: users.length,
          itemBuilder: (context, index) {
            final restInfo = users[index];
            return Container(
              margin: EdgeInsets.only(top: 15, left: 10, right: 10),
              padding: EdgeInsets.all(15),
              //height: MediaQuery.of(context).size.height * .22,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(restInfo.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          restInfo.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(
                                  2,
                                  2,
                                ), // X, Y offset of the shadow
                                blurRadius: 4.0, // How soft the shadow looks
                                color: Colors.black54, // Shadow color
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        SizedBox(width: 3),
                        Text(
                          restInfo.rating,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),

                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        restInfo.description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2), // X, Y offset of the shadow
                              blurRadius: 4.0, // How soft the shadow looks
                              color: Colors.black54, // Shadow color
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 33),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Restaurant Type: ${restInfo.category}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2), // X, Y offset of the shadow
                              blurRadius: 4.0, // How soft the shadow looks
                              color: Colors.black54, // Shadow color
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        restInfo.location,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2), // X, Y offset of the shadow
                              blurRadius: 4.0, // How soft the shadow looks
                              color: Colors.black54, // Shadow color
                            ),
                          ],
                        ),
                      ),
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
