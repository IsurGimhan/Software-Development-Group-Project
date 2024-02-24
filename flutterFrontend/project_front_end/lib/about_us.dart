import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(149, 220, 137, 1),
      appBar: AppBar(
        //title: const Text('EcoChrono'),
        backgroundColor: const Color.fromARGB(255, 166, 233, 168),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
            onPressed: () {},
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/aboutUs.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                  // color: Colors.amber,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: 50,
                width: 100,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ABOUT US',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              lorem(paragraphs: 2, words: 50),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'SOCIALS :',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.yellow,
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.linkedin,
                    size: 30,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.yellow,
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.twitter,
                    size: 30,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.yellow,
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
