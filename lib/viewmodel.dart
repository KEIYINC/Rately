import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier{
  var image;
  bool cropAfterPicked = false;

  Future setCropAfterPicked(bool value) async {
    this.cropAfterPicked = value;
    this.notifyListeners();
  }

  Future setImage(var file) async {
    this.image = file;
    this.notifyListeners();
  }
}