import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

//Main widget to run restaurant screen
class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.title});
  final String title;

  @override
  State<RestaurantScreen> createState() => _MyHomePageState();
}

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
          Text(
            'OPENING HOURS: $openhr',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 20,
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

class _MyHomePageState extends State<RestaurantScreen> {
  List<List<dynamic>> _data = [];
  var datetime = DateTime.now();

  void _loadCSV() async {
    final rawData = await rootBundle.loadString("assets/Restaurants.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    setState(() {
      _data = listData;
    });
  }

  ScrollController scrollController = ScrollController(
    initialScrollOffset: 10, // or whatever offset you wish
    keepScrollOffset: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UIUC Eats"),
      ),
      body: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _data.length,
        itemBuilder: (_, index) {
          int curTime = int.parse(datetime.hour.toString());
          var checkstartTime = _data[index][1]
              .toString()
              .split(':')[0]
              .replaceAll(RegExp(r'[^0-9]'), '');
          int startTime;
          if (checkstartTime == "") {
            startTime = 0;
          } else {
            startTime = int.parse(checkstartTime);
          }
          var checkcloseTime = _data[index][2]
              .toString()
              .split(':')[0]
              .replaceAll(RegExp(r'[^0-9]'), '');
          int closeTime;
          if (checkcloseTime == "") {
            closeTime = 0;
          } else {
            closeTime = int.parse(checkcloseTime);
          }
          return Card(
            margin: const EdgeInsets.all(3),
            color: index == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              title: Text(_data[index][0].toString()),
              subtitle: Text(_data[index][3].toString()),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      // Background color
                      foregroundColor: Colors.white,
                      // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RestaurantInfoPage(
                                  name: _data[index][0].toString(),
                                  openhr: _data[index][1].toString(),
                                  closedhr: _data[index][2].toString(),
                                  cuisine: _data[index][3].toString(),
                                )),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      (curTime < startTime || curTime >= closeTime
                          ? "Closed"
                          : "Open"),
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadCSV,
        child: const Icon(Icons.refresh),
      ),
      // Display the contents from the CSV file
    );
  }
}



/*
Might need for later if code doesn't work
//Class for restaurant data
class Restaurant {
  final String name;
  final String openhr;
  final String closedhr;
  final String cuisine;

  const Restaurant({
    required this.name,
    required this.openhr,
    required this.closedhr,
    required this.cuisine,
  });
}
*/