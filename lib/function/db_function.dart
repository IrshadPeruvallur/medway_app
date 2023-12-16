// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/function/favourite_db_function.dart';
import 'package:medway_app/function/user_db_function.dart';
import 'package:medway_app/model/data_model.dart';
import 'package:medway_app/model/fvrt_model.dart';
import 'package:medway_app/model/profile_model.dart';
import 'package:medway_app/screens/reshedule_appointment.dart';
import 'package:medway_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<List<PatientModel>> patientListNotifier = ValueNotifier([]);

addAppointment(PatientModel value) async {
  // patientListNotifier.value.add(value);
  final patientDB = await Hive.openBox<PatientModel>('patient_db');
  patientDB.add(value);
  patientListNotifier.notifyListeners();
}

getAllAppoitnment() async {
  final patientDB = await Hive.openBox<PatientModel>('patient_db');
  patientListNotifier.value.clear();
  patientListNotifier.value.addAll(patientDB.values);
  patientListNotifier.notifyListeners();
}

void deleteAccount(BuildContext context) async {
  final _shardPrfs = await SharedPreferences.getInstance();
  await _shardPrfs.clear();
  final patientDB = await Hive.openBox<PatientModel>('patient_db');
  patientDB.clear();
  patientListNotifier.value.clear();
  final userDB = await Hive.openBox<UserModel>("User_db");
  userDB.clear();
  userListNotifier.value.clear();
  final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");
  fvrtDB.clear();
  favouriteListNotifier.value.clear();

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => const WelcomeScreen(),
    ),
    (route) => false,
  );
}

cancelAppointment(int index) async {
  final patientDB = await Hive.openBox<PatientModel>('patient_db');
  await patientDB.deleteAt(index);
  getAllAppoitnment();
}

updateAppointment(int index, drname, drspeciality, drpic) async {
  final patientDB = await Hive.openBox<PatientModel>('patient_db');
  if (index >= 0 && index < patientDB.length) {
    final updateDetails = PatientModel(
        doctorname: drname,
        doctorspecality: drspeciality,
        doctorpic: drpic,
        name: rnameController.text,
        phone: rphoneController.text,
        age: rageController.text,
        gender: rgenderController.text,
        problem: rproblemController.text,
        time: rtimeController.text,
        date: rdateController.text);
    await patientDB.putAt(index, updateDetails);
    getAllAppoitnment();
  }
}
