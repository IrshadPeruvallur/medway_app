import 'package:flutter/material.dart';
import 'package:medway_app/services/appointment_service.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';

class SearchProvider extends ChangeNotifier {
  // List<PatientModel> searchedPatient = [];

  // loadFood() async {
  //   final allfood = patientListNotifier.value;

  //   searchedPatient = allfood;
  //   notifyListeners();
  // }

  // void filter(String enteredName) {
  //   List<PatientModel> result = [];

  //   if (enteredName.isEmpty) {
  //     result = patientListNotifier.value;
  //   } else {
  //     result = patientListNotifier.value
  //         .where((PatientModel patient) =>
  //             patient.name.toLowerCase().contains(enteredName.toLowerCase()))
  //         .toList();
  //   }

  //   searchedPatient = result;
  //   notifyListeners();
  // }
}
