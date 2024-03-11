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
        title: const Text('image select panel'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          selectedImage != null
              ? Image.file(selectedImage!)
              : const Text('no image is selected'),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    width: 500,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // gallery selecting button
                        ElevatedButton.icon(
                          onPressed: () {
                            selectImageFromGallery();
                          },
                          icon: const Icon(Icons.photo),
                          label: const Text('Browse Gallery'),
                        ),
                        const Text('OR'),
                        // camera selecting button
                        ElevatedButton.icon(
                          onPressed: () {
                            captureImageFromCamera();
                          },
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Use Camera'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text('Select image'),
          ),
          ElevatedButton(
            onPressed: () async {
              var treeType = await sendImageToBackend(selectedImage!);
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => tree_diamter_take(treeType : treeType),
                ),
              );
            },
            child: const Text("Next page"),
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
