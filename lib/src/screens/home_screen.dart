import 'package:flutter/material.dart';
import 'package:restaurant_app/src/screens/restaurant_screen_improved.dart';

//TitleScreen of restaurant page
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UIUC Eats"),
      ),
      body: Center(
        child: Align(
          alignment: FractionalOffset.center,
          child: SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const RestaurantScreen(title: "UIUC Eats")),
                );
              },
              child: const Text('Welcome'),
            ),
          ),
        ),
      ),
    );
  }
}
