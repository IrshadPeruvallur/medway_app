// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/model/profile_model.dart';
import 'package:medway_app/screens/profile/edit_profile.dart';

ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);

addUser(UserModel value) async {
  final userDB = await Hive.openBox<UserModel>("User_db");
  userDB.add(value);
  userListNotifier.notifyListeners();
}

getAllUser() async {
  final userDB = await Hive.openBox<UserModel>("User_db");
  userListNotifier.value.clear();
  userListNotifier.value.addAll(userDB.values);
  userListNotifier.notifyListeners();
}

updateProfile(int index) async {
  final userDB = await Hive.openBox<UserModel>("User_db");
  if (index >= 0 && index < userDB.length) {
    final updateDetails = UserModel(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        dob: dobController.text,
        image: picked!.path);
    await userDB.putAt(index, updateDetails);
    getAllUser();
  }
}
