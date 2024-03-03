import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_front_end/about_us.dart';
import 'package:project_front_end/leaf_image_taker.dart';
import 'package:project_front_end/tree_diameter_taker.dart';
import 'package:project_front_end/settings_page.dart';
import 'package:project_front_end/tree_history.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Add a GlobalKey to Scaffold
      backgroundColor: const Color.fromRGBO(149, 220, 137, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 166, 233, 168),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Open the drawer
          },
          icon: const FaIcon(FontAwesomeIcons.bars),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 166, 233, 168),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      'EcoChrono',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.xmark,
                        size: 30,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState
                            ?.openEndDrawer(); // Close the Drawer
                      },
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('SETTINGS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage(
                            title: 'gg',
                          )),
                );
              },
            ),
            ListTile(
              title: const Text('ABOUT US'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutUS(
                            title: 'gg',
                          )),
                );
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            // ignore: sized_box_for_whitespace
            child: Container(
              // color: const Color.fromARGB(255, 73, 62, 62),
              width: 300,
              height: 50,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'EcoChrono',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 120.0,
              width: 120.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Page01.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
                // color: Colors.amber,
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => leaf_image_take()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                width: 300,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // color: Colors.yellow,
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.calculator,
                          size: 50,
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // color: Color.fromARGB(255, 13, 37, 252)
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'CALCULATE THE TREE AGE',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              width: 300,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      // color: Colors.yellow,
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: FaIcon(
                        FontAwesomeIcons.circleDot,
                        size: 50,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tree_diamter_take()),
                      );
                    },
                    child: Container(
                      height: 300,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // color: Color.fromARGB(255, 13, 37, 252)
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'TREE DIAMETER',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const TreeHistory(title: 'Tree History')),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              width: 300,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: FaIcon(
                        FontAwesomeIcons.tree,
                        size: 50,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'PREVIOUS TREE HISTORY',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
