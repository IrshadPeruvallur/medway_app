import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medway_app/services/patient.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';
import 'package:medway_app/view/appointments_pages/my_appointment_screen.dart';

class AppointmentProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final problemController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final genderController = TextEditingController();
  String dropdownvalue = "Select One";
  // dynamic get formKey => _formKey;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
    notifyListeners();
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      DateTime now = DateTime.now();
      DateTime selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      timeController.text = DateFormat.jm().format(selectedDateTime);
    }
    notifyListeners();
  }

  void changeGender(newvalue) {
    dropdownvalue = newvalue.toString();
    genderController.text = dropdownvalue;
    notifyListeners();
  }

  void onAddPatientButtonClicked(
      context, docterspeciality, docterName, docterPic, index) async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final phone = phoneController.text.trim();
    final problem = problemController.text.trim();
    final gender = genderController.text.trim();
    final time = timeController.text.trim();
    final date = dateController.text.trim();
    nameController.clear();
    ageController.clear();
    phoneController.clear();
    problemController.clear();
    genderController.clear();
    timeController.clear();
    dateController.clear();

    if (name.isEmpty ||
        age.isEmpty ||
        phone.isEmpty ||
        problem.isEmpty ||
        date.isEmpty ||
        time.isEmpty) {
      return;
    }
    final _patient = PatientModel(
        doctorpic: docterPic,
        doctorname: docterName,
        doctorspecality: docterspeciality,
        name: name,
        phone: phone,
        age: age,
        gender: gender,
        problem: problem,
        time: time,
        date: date);
    addAppointment(_patient);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MyAppointment(
          index: index,
          doctorname: docterName,
          doctorspeciality: docterspeciality,
          doctorspicture: docterPic,
          name: name,
          phone: phone,
          gender: gender,
          age: age,
          problem: problem,
          date: date,
          time: time);
    }));
    notifyListeners();
  }
}
