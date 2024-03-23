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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          selectedImage != null
              ? Image.file(selectedImage!)
              : const Text('No image is selected',
                  style: TextStyle(
                    fontSize: 16, // Set font size
                    fontWeight: FontWeight.bold, // Set font weight
                    color: Color.fromARGB(255, 0, 0, 0),
                  )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255), // Set button color
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
                        // gallery selecting button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 255, 255, 255), // Set button color
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
                        // camera selecting button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 255, 255, 255), // Set button color
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
                  fontSize: 16, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255), // Set button color
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
                  fontSize: 16, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
          ),
        ]),
      ),
    );
  }

  // this method will select the image from the gallery and save it to the returnedImage variable
  Future selectImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  // this method will capture the image from the camera and save it to the returnedImage variable
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
