import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataDisplayPage extends StatefulWidget {
  final String treeType;
  final String circumference;
  const DataDisplayPage(
      {super.key, required this.treeType, required this.circumference});

  @override
  _DataDisplayPageState createState() => _DataDisplayPageState();
}

class _DataDisplayPageState extends State<DataDisplayPage> {
  List<Map<String, dynamic>> dataList = [];
  late String treeType;
  late String circumference;

  @override
  void initState() {
    super.initState();
    didChangeDependencies();
    fetchData(treeType, circumference);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    treeType = widget.treeType;
    circumference = widget.circumference;
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
                bool? isChecked = false;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        dataList[index]['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: 460,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  dataList[index]['description'],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Estimated Age: ${dataList[index]['tree age']}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue ?? false;
                            });
                          },
                        ),
                        Text('Save current Location'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle save button press
                          },
                          child: Text('Save'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
    );
  }

  Future<void> fetchData(String TreeType, String Circumference) async {
    final treeType = TreeType.replaceAll('"', '');
    final circumference = Circumference.replaceAll('"', '');
    final url =
        Uri.parse('http://10.0.2.2:8000/treeDetails/$treeType/$circumference');

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

  Function saveButton() {
    
  }
}
