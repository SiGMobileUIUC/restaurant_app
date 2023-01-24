import 'package:flutter/material.dart';
import 'package:restaurant_app/src/screens/home_screen.dart';
import 'package:restaurant_app/src/screens/restaurant_screen_improved.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UIUC eats app',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomeScreen(),
    );
  }
}
