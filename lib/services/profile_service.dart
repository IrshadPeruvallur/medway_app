// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/controller/db_providers/db_appointment.dart';
import 'package:medway_app/model/cancel_model/canceled_model.dart';
import 'package:medway_app/model/favourite_model/fvrt_model.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';
import 'package:medway_app/model/profile_model/profile_model.dart';
import 'package:medway_app/view/welcome_pages/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices extends ChangeNotifier {
  addUser(UserModel value) async {
    final userDB = await Hive.openBox<UserModel>("User_db");
    userDB.add(value);
  }

  getAllUser() async {
    final userDB = await Hive.openBox<UserModel>("User_db");
    return userDB.values.toList();
  }

  updateProfile(UserModel value, int index) async {
    final userDB = await Hive.openBox<UserModel>("User_db");
    await userDB.putAt(index, value);
  }

  deleteAccount(BuildContext context) async {
    final _shardPrfs = await SharedPreferences.getInstance();
    await _shardPrfs.clear();
    final patientDB = await Hive.openBox<PatientModel>('patient_db');
    patientDB.clear();
    final userDB = await Hive.openBox<UserModel>("User_db");
    userDB.clear();
    final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");
    fvrtDB.clear();
    final cancelDB = await Hive.openBox<CanceldModel>("cancel_db");
    cancelDB.clear();
  }
}
