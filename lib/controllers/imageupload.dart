import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImages extends ChangeNotifier {
  ImagePicker picker = ImagePicker();
  File? selectedImage;

  void upload() async {
    XFile? store = await picker.pickImage(source: ImageSource.gallery);

    if (store != null) {
      selectedImage = File(store.path);
      notifyListeners();
    }
  }
}
