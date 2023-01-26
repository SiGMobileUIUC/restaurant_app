import 'package:flutter/material.dart';
import 'package:restaurant_app/src/misc/colors.dart';
import 'package:restaurant_app/src/screens/restaurant_list_screen.dart';
import 'package:restaurant_app/src/components/restaurant_appbar.dart';

typedef CSVCallback = void Function();

//TitleScreen of restaurant page
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.csvFun}) : super(key: key);

  CSVCallback? csvFun;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const RestaurantAppBar(),
          SliverToBoxAdapter(
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
                      //csvFun();
                    );
                  },
                  child: const Text('Welcome'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




/*
Gradient Container for appbar
flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 255, 115, 0),
                Color.fromARGB(255, 255, 255, 255),
              ],
            ),
          ),
        ),
        */