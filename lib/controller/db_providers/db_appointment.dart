import 'package:flutter/material.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';
import 'package:medway_app/services/appointment_service.dart';

class DBAppointment extends ChangeNotifier {
  final AppointmentService _appointmentService = AppointmentService();
  List<PatientModel> patientList = [];

  Future<void> getAllAppointment() async {
    patientList = await _appointmentService.getAllAppointment();
    notifyListeners();
  }

  Future<void> addAppointment(PatientModel value) async {
    await _appointmentService.addAppointment(value);
    await getAllAppointment();
  }

  Future<void> cancelAppointment(int index) async {
    await _appointmentService.cancelAppointment(index);
    await getAllAppointment();
  }

  Future<void> updateAppointment(PatientModel value, index) async {
    await _appointmentService.updateAppointment(value, index);
    await getAllAppointment();
  }
}
