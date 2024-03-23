import 'package:flutter/material.dart';
import 'package:project_front_end/tree_info.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: tree_diamter_take(
        treeType: '',
      ),
    );
  }
}

class tree_diamter_take extends StatefulWidget {
  final String treeType;
  const tree_diamter_take({super.key, required this.treeType});
  @override
  State<tree_diamter_take> createState() => _HomeScreenState(treeType);
}

class _HomeScreenState extends State<tree_diamter_take> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isInputValid = false;

  _HomeScreenState(String treeType);

  @override
  Widget build(BuildContext context) {
    String treeType = widget.treeType;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Select Panel',
            style: TextStyle(
              fontSize: 20, // Set font size
              fontWeight: FontWeight.bold, // Set font weight
              color: Color.fromARGB(255, 0, 0, 0),
            )),
        backgroundColor: const Color.fromARGB(255, 166, 233, 168),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(149, 220, 137, 1),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: const Text('Enter Something',
                          style: TextStyle(
                            fontSize: 25, // Set font size
                            fontWeight: FontWeight.bold, // Set font weight
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                      content: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                            hintText: 'Enter double value'),
                        onChanged: (value) {
                          setState(() {
                            _isInputValid = double.tryParse(value) != null;
                          });
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel',
                              style: TextStyle(
                                fontSize: 16, // Set font size
                                fontWeight: FontWeight.bold, // Set font weight
                                color: Color.fromARGB(255, 0, 0, 0),
                              )),
                        ),
                        ElevatedButton(
                          onPressed: _isInputValid
                              ? () {
                                  String circumference =
                                      _textEditingController.text;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DataDisplayPage(
                                              treeType: treeType,
                                              circumference: circumference,
                                            )),
                                  );
                                }
                              : null,
                          child: const Text('Submit',
                              style: TextStyle(
                                fontSize: 16, // Set font size
                                fontWeight: FontWeight.bold, // Set font weight
                                color: Color.fromARGB(255, 0, 0, 0),
                              )),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          child: const Text('Show Popup',
              style: TextStyle(
                fontSize: 16, // Set font size
                fontWeight: FontWeight.bold, // Set font weight
                color: Color.fromARGB(255, 0, 0, 0),
              )),
        ),
      ),
    );
  }
}
