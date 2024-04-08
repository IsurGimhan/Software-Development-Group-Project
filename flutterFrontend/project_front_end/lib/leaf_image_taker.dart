import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:project_front_end/tree_diameter_taker.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: leaf_image_take(),
    );
  }
}

class leaf_image_take extends StatefulWidget {
  @override
  State<leaf_image_take> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<leaf_image_take> {
  File? selectedImage;
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Select Panel',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImage != null
                ? Image.file(selectedImage!)
                : Column(
                    children: [
                      Image.asset(
                        'assets/logo.png', // Replace 'no_image_selected.png' with the path to your placeholder image asset
                        width: 300, // Adjust width as needed
                        height: 200, // Adjust height as needed
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'No image is selected',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      width: 500,
                      color: const Color.fromARGB(255, 166, 233, 168),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                            ),
                            onPressed: () {
                              selectImageFromGallery();
                            },
                            icon: const Icon(Icons.photo,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            label: const Text('Browse Gallery',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                          const Text('OR'),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                            ),
                            onPressed: () {
                              captureImageFromCamera();
                            },
                            icon: const Icon(Icons.camera_alt,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            label: const Text('Use Camera',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Select Image',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () async {
                var treeType = await sendImageToBackend(selectedImage!);
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tree_diamter_take(treeType: treeType),
                  ),
                );
              },
              child: const Text("Next page",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future selectImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  Future captureImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  Future<String> sendImageToBackend(File image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:8000/TreeIdentification/identify_image/'),
    );

    request.files.add(await http.MultipartFile.fromPath(
      'image',
      image.path,
    ));

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    return responseBody;
  }
}
