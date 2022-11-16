
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: const TitleRoute(),
    );
  }
}

class TitleRoute extends StatelessWidget {
  const TitleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Eats"),
      ),
      body: Center(
        child: Align(
          alignment: FractionalOffset.center,
          child: SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(title: "UI Eats")),
                );
              },
              child: const Text('Welcome'),
            ),
          ),
        ),
      ),
    );
  }
}

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
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
