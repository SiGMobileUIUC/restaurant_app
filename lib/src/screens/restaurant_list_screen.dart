import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/src/screens/restaurant_info_pages.dart';
import 'package:restaurant_app/src/misc/colors.dart';
import 'package:restaurant_app/src/components/restaurant_appbar.dart';
import 'package:restaurant_app/src/components/search_bar.dart';
import 'package:restaurant_app/src/screens/home_screen.dart';

import '../components/chip_builder.dart';

//Main widget to run restaurant screen
class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.title});
  final String title;

  @override
  State<RestaurantScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RestaurantScreen> {
  //We use a dynamic type to avoid issues while parsing the CSV into the nested lists of data
  List<List<dynamic>> _data = [];
  //Imported a dayTime package that allows us to get the current time/date when app loads of the current timezone
  var datetime = DateTime.now();

  //Using an async function to load the data from the CSV so that the function can be called when we press a button
  void _loadCSV() async {
    //We set the location of the CSV in the assets folder and accessed it using RootBundle to load it as a string to pass it into the CSVToListConverter
    final rawData = await rootBundle.loadString("assets/Restaurants.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    //Using setState to update the class variable with the converted CSV
    setState(() {
      _data = listData;
    });
  }

  //List of cuisines
  List<String> cuisines = [];

  void sortCuisines() {
    for (int x = 0; x < _data.length; x++) {
      //Set the list of cuisines with the values obtained from parsing the CSV
      cuisines.add(_data[x][3].toString());
    }
    cuisines = cuisines.toSet().toList();
  }

  int selectedIdx = 0;

  //Scroll controller created so that we can can use the ListView.builder effectively
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 10, // or whatever offset you wish
    keepScrollOffset: true,
  );

  @override
  void initState() {
    super.initState();
    //We call the function to load the CSV when the app loads
    _loadCSV();
    sortCuisines();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Instead of using an AppBar widget we use a flexible space to replace the appbar with a widget of our choosing
        flexibleSpace: Container(
          //We use DecoratedBox to allow us to use a gradient in the AppBar
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
              onPressed: () async {
                //Sorts the cuisines and runs the search bar with the passed cuisines as a parameters
                sortCuisines();
                final searchResults = await showSearch(
                  context: context,
                  //Created a search bar in the Appbar that connects to SearchDelegate class we have overwritten to suggest and search for cuisines
                  delegate: MySearchDelgate(cuisines: cuisines),
                );
                setState(() {
                  _data = _data
                      .where((data) => data[3]
                          .toLowerCase()
                          .contains(searchResults.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: buildChip(cuisines: _data),
          ),

          //Slivers allow you to have multiple scrollable widgets on the screen at the same time
          SliverToBoxAdapter(
            //Listview builder to create similar looking tiles of all the restaurants and their information
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _data.length,
              itemBuilder: (_, index) {
                //Parse the dayTime var to only have hours so that we can compare with hourse in CSV
                int curTime = int.parse(datetime.hour.toString());
                //We first splite the hours variable from CSV to make sure it's a RegExp variable so that we get no null errors
                var checkstartTime = _data[index][1]
                    .toString()
                    .split(':')[0]
                    .replaceAll(RegExp(r'[^0-9]'), '');
                int startTime;
                //We check if parsed hours var returned a valid number or was empty and set time accordingly
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
                  //We set the color of a selected tile different than that of a non-selected tile
                  color: index == selectedIdx ? Colors.blue : Colors.white,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        //Updates Index of tile selected so that we can change color of it
                        selectedIdx = index;
                      });
                    },
                    //Title is name of restaurant
                    title: Text(_data[index][0].toString()),
                    //Subtitle is cuisine of restaurant
                    subtitle: Text(_data[index][3].toString()),
                    //We trail with 2 buttons, one to visit screen of restaurants information
                    //Other button shows easy access to opening and closing times of restaurant
                    trailing: Wrap(
                      spacing: 30, // space between two icons
                      children: <Widget>[
                        DecoratedBox(
                          //Used decoratedbox to create UIUC colors gradient on button
                          decoration: BoxDecoration(
                            gradient: kOrangeBlue,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: const Color.fromARGB(0, 255, 255, 255),
                            ),
                          ),
                          child: ElevatedButton(
                            //Made elevated button invisible so that we can have a gradient on a Text widget but have it still function as a button
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
                                    //When we click on the visit button to see the restaurants information we passed on the parameters about the restaurant
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
                                //Conditionals to check if current time is past midnight or not and compare int values of times
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
                                //When time button is pressed it brings up an alert box that shows the opening and closing times without navigating to another page
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
    //Test
  }
}
