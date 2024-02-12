import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataDisplayPage extends StatefulWidget {
  const DataDisplayPage({Key? key}) : super(key: key);

  @override
  _DataDisplayPageState createState() => _DataDisplayPageState();
}

class _DataDisplayPageState extends State<DataDisplayPage> {
  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('http://192.168.0.103:8000/treeDetails/Mangifera indica/');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          dataList = [json.decode(response.body)];
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Display'),
      ),
      body: dataList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dataList[index]['title']),
                  subtitle: Text(dataList[index]['description']),
                );
              },
            ),
    );
  }
}
