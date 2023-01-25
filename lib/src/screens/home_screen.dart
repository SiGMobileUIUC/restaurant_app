import 'package:flutter/material.dart';
import 'package:restaurant_app/src/screens/restaurant_list_screen.dart';

//TitleScreen of restaurant page
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UIUC Eats"),
      ),
      body: Align(
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
    );
  }
}
