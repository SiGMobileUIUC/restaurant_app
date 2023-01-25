import 'package:flutter/material.dart';
import 'package:restaurant_app/src/screens/home_screen.dart';

void main() {
  // Added to use "Isolate / Compute".
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UIUC eats app',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomeScreen(),
    );
  }
}



//1st line of CSV
//Restaurants on Campus,Opening Time,Closing Time,Cuisine 