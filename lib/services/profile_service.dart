// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/controller/db_providers/db_appointment.dart';
import 'package:medway_app/model/cancel_model/canceled_model.dart';
import 'package:medway_app/model/favourite_model/fvrt_model.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';
import 'package:medway_app/model/profile_model/profile_model.dart';
import 'package:medway_app/view/settings_tabs/profile/edit_profile.dart';
import 'package:medway_app/view/welcome_pages/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

void deleteAccount(BuildContext context) async {
  final getProvider = Provider.of<DBAppointment>(context);
  final _shardPrfs = await SharedPreferences.getInstance();
  await _shardPrfs.clear();
  final patientDB = await Hive.openBox<PatientModel>('patient_db');
  patientDB.clear();
  // patientListNotifier.value.clear();
  final userDB = await Hive.openBox<UserModel>("User_db");
  userDB.clear();
  userListNotifier.value.clear();
  final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");
  fvrtDB.clear();
  // favouriteListNotifier.value.clear();
  final cancelDB = await Hive.openBox<CanceldModel>("cancel_db");
  cancelDB.clear();

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => const WelcomeScreen(),
    ),
    (route) => false,
  );
}
