import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final imagePicker = ImagePicker();
  File? picked;

  updateImage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    picked = File(img!.path);
  }
}
