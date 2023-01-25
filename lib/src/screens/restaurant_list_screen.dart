import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/src/screens/restaurant_info_pages.dart';

//Main widget to run restaurant screen
class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.title});
  final String title;

  @override
  State<RestaurantScreen> createState() => _MyHomePageState();
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
