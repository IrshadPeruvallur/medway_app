import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';

class AppointmentService {
  addAppointment(PatientModel value) async {
    final patientDB = await Hive.openBox<PatientModel>('patient_db');
    await patientDB.add(value);
  }

  getAllAppointment() async {
    final patientDB = await Hive.openBox<PatientModel>('patient_db');
    return patientDB.values.toList();
  }

  cancelAppointment(int index) async {
    final patientDB = await Hive.openBox<PatientModel>('patient_db');
    await patientDB.deleteAt(index);
  }

  updateAppointment(PatientModel value, index) async {
    final patientDB = await Hive.openBox<PatientModel>('patient_db');
    await patientDB.putAt(index, value);
  }
}
