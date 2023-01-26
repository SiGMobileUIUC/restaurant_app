import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/src/screens/restaurant_list_screen.dart';

//Restaurant info page widget
class RestaurantInfoPage extends StatelessWidget {
  final String name;
  final String openhr;
  final String closedhr;
  final String cuisine;

  const RestaurantInfoPage({
    Key? key,
    required this.name,
    required this.openhr,
    required this.closedhr,
    required this.cuisine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 35,
                height: 3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
            child: Text(
              'CLOSING HOURS: $openhr',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
            child: Text(
              'CLOSING HOURS: $closedhr',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 80),
            child: Text(
              'A $cuisine restaurant.',
              //thats famous for serving burritos and rice bowls. They are popular among the muslim population as they offer Halal meat.
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          )
        ],
      )),
    );
  }
}
