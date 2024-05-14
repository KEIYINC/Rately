import 'dart:io';

import 'package:bitirme/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImagePickPage extends StatelessWidget {
  Future<File> cropImage(var image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image!.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    File newfile = File(croppedFile!.path);
    return newfile;
  }

  Future<File?> getImageFromSource(ImageSource source, bool toCrop) async {
    var image = await ImagePicker().pickImage(source: source);
    if(image == null) return null;
    if(toCrop){
      var croppedImage = await cropImage(File(image.path));
      return croppedImage;
    }
    return File(image.path);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick an image"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<ViewModel>(
        create: (context) => ViewModel(),
        child: Consumer<ViewModel>(
          builder: (context, viewmodel, child) {
            return Center(
              child: Column(
                children: [
                  if (viewmodel.image == null)
                    Icon(
                      Icons.camera,
                      size: 70,
                    ),
                  if (viewmodel.image != null)
                    Image.file(viewmodel.image, height: 200),
                  CheckboxListTile(
                    title: Text("Crop after picked"),
                    value: viewmodel.cropAfterPicked,
                    onChanged: (value) {
                      viewmodel.setCropAfterPicked(value!);
                    },
                  ),
                  TextButton(
                    onPressed: () async {
                      var image = await getImageFromSource(ImageSource.gallery, viewmodel.cropAfterPicked);
                      if (image == null) return;
                      viewmodel.setImage(image);
                    },
                    child: Text("Get image from gallery"),
                  ),
                  TextButton(
                    onPressed: () async {
                      var image = await getImageFromSource(ImageSource.camera, viewmodel.cropAfterPicked);
                      if (image == null) return;
                      viewmodel.setImage(image);
                    },
                    child: Text("Get image from camera"),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (viewmodel.image == null) return;
                      var image = await cropImage(viewmodel.image);
                      if (image == null) return;
                      viewmodel.setImage(image);
                    },
                    child: Text("Crop image"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
