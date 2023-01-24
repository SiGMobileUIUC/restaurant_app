import 'package:flutter/material.dart';

//Main widget to run restaurant screen

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mia Za's"),
      ),
      body: Center(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shawarma Joint"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: const Text(
              'Shawarma Joint',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 35,
                height: 3,
              ),
            ),
          ),
          const Text(
            'OPENING HOURS: 11:00 AM',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
            child: const Text(
              'CLOSING HOURS: 10:00 PM',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 80),
            child: const Text(
              'A mediterranean restaurant thats famous for serving burritos and rice bowls. They are popular among the muslim population as they offer Halal meat.',
              textAlign: TextAlign.center,
              style: TextStyle(
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

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.title});
  final String title;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
              title: Text("Mia Za's"),
              subtitle: Text("Pizza Place"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                ),
              ),
              title: Text('Shawarma Joint'),
              subtitle: Text("Mediterranean"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.purpleAccent,
                ),
              ),
              title: Text('Thai Fusion'),
              subtitle: Text("Thai"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
              ),
              title: Text('BangKok Thai'),
              subtitle: Text("Thai"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                ),
              ),
              title: Text('Papa Johns'),
              subtitle: Text("Pizza Place"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
              ),
              title: Text('Dominos'),
              subtitle: Text("Pizza Place"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.pinkAccent,
                ),
              ),
              title: Text('Taco Bell'),
              subtitle: Text("Mexican"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                ),
              ),
              title: Text('Signature Grill'),
              subtitle: Text("Indian"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.tealAccent,
                ),
              ),
              title: Text('KungFu Tea'),
              subtitle: Text("Sushi"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                ),
              ),
              title: Text('Potbelly'),
              subtitle: Text("Fast Food"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
              ),
              title: Text('Mc Donalds'),
              subtitle: Text("Fast Food"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
              ),
              title: Text('Subway'),
              subtitle: Text("Fast Food"),
              trailing: Wrap(
                spacing: 20, // space between two icons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Visit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "CLOSED",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ), // icon-2
                ],
              ),
            ),
          ],
        ));
  }
}
