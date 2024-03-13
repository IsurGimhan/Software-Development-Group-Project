import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_front_end/web_view_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/webViewContainer': (context) => const WebViewContainer()},
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AboutUS(title: 'Flutter Demo Home Page'),
    );
  }
}

class AboutUS extends StatefulWidget {
  const AboutUS({super.key, required this.title});
  final String title;

  @override
  State<AboutUS> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AboutUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(149, 220, 137, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 166, 233, 168),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // Pop the current route
          },
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'ABOUT US',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Building the Future of Tree Identification\n",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "We're a team of passionate individuals driven by a common goal: to empower users with innovative technology that fosters a deeper connection with nature. This app, EcoChrono, is a product of our dedication to creating user-friendly and impactful applications.\n\n",
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Meet the Minds Behind the App:\n",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Rakhitha:\n I'm a Flutter developer for EcoChrono, working closely with the team to build a seamless and user-friendly experience for our users. My passion for mobile app development and creating beautiful user interfaces (UIs) made me excited to be a part of this project. Witnessing the app come to life and empower users to connect with nature is truly fulfilling!\n\n"
                      "[Team member 1 name] (Contributor): [ Briefly describe their role and expertise relevant to the app].\n\n"
                      "[Team member 2 name] (Contributor): [ Briefly describe their role and expertise relevant to the app] (You can add more team members if applicable).\n\n"
                      "[Team member 1 name] (Contributor): [ Briefly describe their role and expertise relevant to the app].\n\n"
                      "[Team member 2 name] (Contributor): [ Briefly describe their role and expertise relevant to the app] (You can add more team members if applicable).\n\n"
                      "[Team member 1 name] (Contributor): [ Briefly describe their role and expertise relevant to the app].\n\n"
                      "[Team member 2 name] (Contributor): [ Briefly describe their role and expertise relevant to the app] (You can add more team members if applicable).\n\n",
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Our Motivation:\n",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "We believe in the importance of environmental stewardship and appreciate the vital role trees play in our ecosystem. EchoChrono was born from a desire to make tree identification accessible and engaging for everyone. By leveraging the power of mobile technology, we hope to inspire users to learn more about the trees around them and contribute to a better understanding of our natural world.\n\n",
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Our Commitment:\n",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "We are committed to continuous improvement and user satisfaction. We value your feedback and encourage you to share your thoughts and suggestions with us. Together, we can make EcoChrono a valuable resource for anyone who shares our passion for trees and the environment.",
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(
                      149, 220, 137, 1), // background (button) color
                  foregroundColor: const Color.fromARGB(
                      255, 255, 255, 255), // foreground (text) color
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/webViewContainer');
                },
                child: const FaIcon(
                  FontAwesomeIcons.solidMessage,
                  size: 25,
                  color: Colors.black, // Change color as needed
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
