import 'package:flutter/material.dart';
import 'package:restaurant_app/src/misc/colors.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/food_bg.jpg",
          fit: BoxFit.cover,
        ),
      ),
      leading: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepOrange,
          child: Icon(
            Icons.settings,
            size: 20,
          ),
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepOrange,
          child: Icon(
            Icons.share,
            size: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.deepOrange,
            child: Icon(
              Icons.search,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
