import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/function/nrml_function.dart';
import 'package:medway_app/model/data_model.dart';
import 'package:medway_app/screens/splash_screen.dart';
import 'package:medway_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<List<PatientModel>> patientListNotifier = ValueNotifier([]);

addAppointment(PatientModel value) async {
  // patientListNotifier.value.add(value);
  final patientDB = await Hive.openBox<PatientModel>('patient_db');
  patientDB.add(value);
  patientListNotifier.notifyListeners();
  print('sa');
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

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => WelcomeScreen(),
    ),
    (route) => false,
  );
}

cancelAppointment(int index) async {
  final patientDB = await Hive.openBox<PatientModel>('patient_db');
  await patientDB.deleteAt(index);
  getAllAppoitnment();
}
