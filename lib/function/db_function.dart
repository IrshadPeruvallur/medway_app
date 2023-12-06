import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/model/data_model.dart';

ValueNotifier<List<PatientModel>> patientListNotifier = ValueNotifier([]);

addAppointment(PatientModel value) async {
  patientListNotifier.value.add(value);
  patientListNotifier.notifyListeners();
  print('sa');
}
