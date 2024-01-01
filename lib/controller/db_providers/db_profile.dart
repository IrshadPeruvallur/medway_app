import 'package:flutter/material.dart';
import 'package:medway_app/model/profile_model/profile_model.dart';
import 'package:medway_app/services/profile_service.dart';
import 'package:medway_app/view/welcome_pages/welcome_screen.dart';

class DBProfile extends ChangeNotifier {
  final ProfileServices _profileServices = ProfileServices();
  List<UserModel> profileList = [];
  Future<void> getAllUser() async {
    profileList = await _profileServices.getAllUser();
    notifyListeners();
  }

  Future<void> addUser(UserModel value) async {
    await _profileServices.addUser(value);
    getAllUser();
  }

  Future<void> updateUser(int index, UserModel value) async {
    await _profileServices.updateProfile(value, index);
    notifyListeners();
    getAllUser();
  }

  Future<void> deleteAccount(context) async {
    await _profileServices.deleteAccount(context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
      (route) => false,
    );
  }
}
