import 'package:flutter/material.dart';

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
        padding: EdgeInsets.only(left: 20),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          ),
        ),
      ),
    );
  }
}
