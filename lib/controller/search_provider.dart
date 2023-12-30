import 'package:flutter/material.dart';
import 'package:medway_app/controller/db_providers/db_appointment.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  List<PatientModel> searchedPatient = [];

  void loadPatient(BuildContext context) async {
    final getProvider = Provider.of<DBAppointment>(context, listen: false);
    final allPatient = getProvider.patientList;

    searchedPatient = allPatient;
    notifyListeners();
  }

  void filter(String enteredName, BuildContext context) {
    final getProvider = Provider.of<DBAppointment>(context, listen: false);

    if (enteredName.isEmpty) {
      searchedPatient = [...getProvider.patientList];
    } else {
      searchedPatient = getProvider.patientList
          .where((PatientModel patient) =>
              patient.name.toLowerCase().contains(enteredName.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }
}
