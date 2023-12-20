// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medway_app/controller/patient_controller.dart';
import 'package:medway_app/model/patient_model.dart';
import 'package:medway_app/screens/my_appointment_screen.dart';
import 'package:medway_app/screens/widgets/small_widgets.dart';
import 'package:intl/intl.dart';

class Appointment extends StatefulWidget {
  final String docterPic;
  final String docterName;
  final String docterspeciality;
  final int index;

  const Appointment(
      {super.key,
      required this.index,
      required this.docterPic,
      required this.docterName,
      required this.docterspeciality});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final problemController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final genderController = TextEditingController();
  String dropdownvalue = "Select One";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _selectTime(BuildContext context) async {
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

      setState(() {
        timeController.text = DateFormat.jm().format(selectedDateTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: WNormalAppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.width * .054,
                  ),
                  doctersCard(context,
                      picture: widget.docterPic,
                      name: widget.docterName,
                      speciality: widget.docterspeciality),
                  SizedBox(
                    height: screenSize.width * 0.05,
                  ),
                  WTextformField(
                    inputformat:
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    context,
                    label: 'Name',
                  ),
                  WTextformField(
                      maxlength: 10,
                      inputformat: FilteringTextInputFormatter.digitsOnly,
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      context,
                      label: 'Phone',
                      prificsText: '+91'),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  // captiontext(context, text: 'Gender'),
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == "Select One") {
                        return "Plese Choose one";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 16, 105, 140)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    borderRadius:
                        BorderRadius.circular(screenSize.width * 0.02),
                    isExpanded: true,
                    value: dropdownvalue,
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdownvalue = newvalue.toString();
                        genderController.text = dropdownvalue;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                          value: "Select One", child: Text('Select One')),
                      DropdownMenuItem(value: "Male", child: Text('Male')),
                      DropdownMenuItem(value: "Female", child: Text('Female')),
                      DropdownMenuItem(value: "Other", child: Text('Other')),
                    ],
                  ),
                  WTextformField(
                    maxlength: 2,
                    inputformat: FilteringTextInputFormatter.digitsOnly,
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    context,
                    label: 'Age',
                  ),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  WTextformField(
                    inputformat:
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    controller: problemController,
                    keyboardType: TextInputType.text,
                    context,
                    label: 'Problem',
                  ),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  // captiontext(context, text: 'Time'),
                  TextFormField(
                    onTap: () => _selectTime(context),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select Time";
                      } else {
                        return null;
                      }
                    },
                    controller: timeController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        icon: const Icon(Icons.calendar_today),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 16, 105, 140)),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  // captiontext(context, text: 'Date'),
                  TextFormField(
                    onTap: () => _selectDate(context),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select Date";
                      } else {
                        return null;
                      }
                    },
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: const Icon(Icons.calendar_today),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 16, 105, 140)),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: WElevatedButton(context, text: 'Reshedule',
                        navigator: () {
                      if (_formKey.currentState!.validate()) {
                        onAddPatientButtonClicked();
                        Navigator.pop(context);
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onAddPatientButtonClicked() async {
    final _name = nameController.text.trim();
    final _age = ageController.text.trim();
    final _phone = phoneController.text.trim();
    final _problem = problemController.text.trim();
    final _gender = genderController.text.trim();
    final _time = timeController.text.trim();
    final _date = dateController.text.trim();

    if (_name.isEmpty ||
        _age.isEmpty ||
        _phone.isEmpty ||
        _problem.isEmpty ||
        _date.isEmpty ||
        _time.isEmpty) {
      return;
    }
    final _patient = PatientModel(
        doctorpic: widget.docterPic,
        doctorname: widget.docterName,
        doctorspecality: widget.docterspeciality,
        name: _name,
        phone: _phone,
        age: _age,
        gender: _gender,
        problem: _problem,
        time: _time,
        date: _date);
    addAppointment(_patient);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyAppointment(
                index: widget.index,
                doctorname: widget.docterName,
                doctorspeciality: widget.docterspeciality,
                doctorspicture: widget.docterPic,
                name: _name,
                phone: _phone,
                gender: _gender,
                age: _age,
                problem: _problem,
                date: _date,
                time: _time)));
  }
}
