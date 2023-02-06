import 'package:flutter/material.dart';

class buildChip extends StatefulWidget {
  const buildChip({super.key, required this.cuisines});
  final List<List<dynamic>> cuisines;

  @override
  State<buildChip> createState() => _buildChipState();
}

class _buildChipState extends State<buildChip> {
  List<String> cuisine = [];

  void sortCuisine() {
    for (int x = 0; x < widget.cuisines.length; x++) {
      //Set the list of cuisines with the values obtained from parsing the CSV
      //debugPrint('${cuisines[x][3]}');
      cuisine.add(widget.cuisines[x][3].toString());
    }
    cuisine = cuisine.toSet().toList();
  }

  int selectedIdx = 0;
  @override
  Widget build(BuildContext context) {
    sortCuisine();
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cuisine.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: ActionChip(
              onPressed: () {
                setState(() {
                  selectedIdx = index;
                });
              },
              labelPadding: const EdgeInsets.all(1.0),
              label: Text(
                cuisine[index],
                style: TextStyle(
                  color: index == selectedIdx ? Colors.white : Colors.grey[700],
                ),
              ),
              backgroundColor:
                  index == selectedIdx ? Colors.deepOrange : Colors.grey[300],
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            ),
          );
        },
      ),
    );
  }
}
