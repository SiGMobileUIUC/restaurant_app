import 'package:flutter/material.dart';

//Extended SearchDelegate class to help with functions needed when using a searchBar
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
  Widget buildResults(BuildContext context) {
    // unused
    return const SizedBox();
  }

  @override
  void showResults(BuildContext context) {
    close(context, query);
  }

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
