import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DataDisplayPage(treeType: '',),
    );
  }
}

class DataDisplayPage extends StatefulWidget {
  final String treeType;
  const DataDisplayPage({Key? key,required this.treeType}) : super(key: key);

  @override
  _DataDisplayPageState createState() => _DataDisplayPageState();
}


class _DataDisplayPageState extends State<DataDisplayPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Display'),
      ),
      body: Center(
        child: widget.treeType != null
            ? Text(widget.treeType!)
            : const Text('No tree type available'),
      ),
    );
  }

}
