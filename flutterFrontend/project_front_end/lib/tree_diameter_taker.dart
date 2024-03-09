import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_front_end/tree_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: tree_diamter_take(),
    );
  }
}

class tree_diamter_take extends StatefulWidget {
  @override
  State<tree_diamter_take> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<tree_diamter_take> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isInputValid = false;

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Window Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: Text('Enter Something'),
                      content: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(hintText: 'Enter double value'),
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
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: _isInputValid
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DataDisplayPage(treeType: '',)),
                                  );
                                  
                                }
                              : null,
                          child: Text('Submit'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          child: Text('Show Popup'),
        ),
      ),
    );
  }
}

