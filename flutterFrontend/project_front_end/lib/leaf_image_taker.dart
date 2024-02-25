import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                            captrueImageFromCamera();
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
        ]),
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

  Future captrueImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }
}
