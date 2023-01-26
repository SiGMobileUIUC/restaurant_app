import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/src/screens/restaurant_info_pages.dart';
import 'package:restaurant_app/src/misc/colors.dart';
import 'package:restaurant_app/src/components/restaurant_appbar.dart';

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

  int selectedIdx = 0;

  ScrollController scrollController = ScrollController(
    initialScrollOffset: 10, // or whatever offset you wish
    keepScrollOffset: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text("UIUC Eats"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ListView.builder(
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
                  color: index == selectedIdx ? Colors.blue : Colors.white,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        selectedIdx = index;
                      });
                    },
                    title: Text(_data[index][0].toString()),
                    subtitle: Text(_data[index][3].toString()),
                    trailing: Wrap(
                      spacing: 30, // space between two icons
                      children: <Widget>[
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: kOrangeBlue,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: const Color.fromARGB(0, 255, 255, 255),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
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
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: const Color.fromARGB(0, 255, 255, 255),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              (curTime < startTime || curTime >= closeTime
                                  ? "Closed"
                                  : "Open"),
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                      "${_data[index][0].toString()} Thai Hours"),
                                  content: Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'OPENING HOURS: ${_data[index][1].toString()}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 90),
                                          child: Text(
                                            'CLOSING HOURS: ${_data[index][2].toString()}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ), // icon-2
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _loadCSV,
        child: const Icon(Icons.refresh),
      ),
      // Display the contents from the CSV file
    );
  }
}
