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

  //List of cuisines
  List<String> cuisines = [];
  void sortCuisines() {
    for (int x = 0; x < _data.length; x++) {
      cuisines.add(_data[x][3].toString());
    }
    cuisines = cuisines.toSet().toList();
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.deepOrange,
                size: 30,
              ),
              onPressed: () {
                sortCuisines();
                showSearch(
                  context: context,
                  delegate: MySearchDelgate(cuisines: cuisines),
                );
              },
            ),
          ),
        ],
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
                              elevation: 0.0,
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
                          child: SizedBox(
                            width: 76,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                (curTime <= 24)
                                    ? ((curTime < startTime || curTime >= 24)
                                        ? "Closed"
                                        : "Open")
                                    : ((curTime < startTime ||
                                            curTime >= closeTime)
                                        ? "Closed"
                                        : "Open"),
                                style: TextStyle(
                                  color: (curTime <= 24)
                                      ? ((curTime < startTime || curTime >= 24)
                                          ? Colors.red
                                          : Colors.green)
                                      : ((curTime < startTime ||
                                              curTime >= closeTime)
                                          ? Colors.red
                                          : Colors.green),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                        "${_data[index][0].toString()} Hours"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'OPENING HOURS: ${_data[index][1].toString()}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          'CLOSING HOURS: ${_data[index][2].toString()}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text("ok"),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
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

class MySearchDelgate extends SearchDelegate {
  final List<String> cuisines;
  MySearchDelgate({required this.cuisines});
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        //Closes the search bar
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            //If searchbar is already empty when clicked, close the search bar
            if (query.isEmpty) {
              close(context, null);
            }
            //Clears the text put into the search bar
            query = '';
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    //List of restaurant cuisines from csv file
    List<String> suggestions = cuisines.where((searchResult) {
      //Checks each of the suggestions if the item in search bar = cuisines
      final result = searchResult.toLowerCase();
      //Sets input var from text in search bar
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        //Shows a list tile of all the cuisines
        return ListTile(
          title: Text(suggestion),
          //Places the cuisine selected into search bar after clicking it
          onTap: () {
            query = suggestion;

            showResults(context);
          },
        );
      },
    );
  }
}
