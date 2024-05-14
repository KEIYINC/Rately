import 'dart:io';
import 'package:bitirme/full_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickDeneme extends StatefulWidget {
  const ImagePickDeneme({super.key});

  @override
  _ImagePickDenemeState createState() => new _ImagePickDenemeState();
}

class _ImagePickDenemeState extends State<ImagePickDeneme> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FullScreenImage(image: imageTemp),
        ),
      );
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            image != null
                ? Image.file(image!)
                : const Text("no image selected"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: pickImage,
                  color: Colors.purple,
                  child: const Text("Image from gallery"),
                ),
                MaterialButton(
                  onPressed: pickImageC,
                  color: Colors.purple,
                  child: const Text("Image from camera"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
