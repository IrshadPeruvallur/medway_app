// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medway_app/controller/db_providers/db_appointment.dart';
import 'package:medway_app/controller/update_provider.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';
import 'package:medway_app/controller/appointment_provider.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';
import 'package:provider/provider.dart';

class ReSheduleAppointment extends StatefulWidget {
  final int index;
  final String doctorname;
  final String doctorpic;
  final String doctorspeciaility;
  final String name;
  final String age;
  final String phone;
  final String gender;
  final String problem;
  final String date;
  final String time;

  const ReSheduleAppointment(
      {super.key,
      required this.index,
      required this.doctorname,
      required this.doctorpic,
      required this.doctorspeciaility,
      required this.name,
      required this.age,
      required this.phone,
      required this.gender,
      required this.problem,
      required this.date,
      required this.time});

  @override
  State<ReSheduleAppointment> createState() => _ReSheduleAppointmentState();
}

class _ReSheduleAppointmentState extends State<ReSheduleAppointment> {
  String dropdownvalue = "Select One";
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    final getProvider = Provider.of<UpdateProvider>(context, listen: false);
    super.initState();
    getProvider.rnameController.text = widget.name;
    getProvider.rageController.text = widget.age;
    getProvider.rphoneController.text = widget.phone;
    getProvider.rproblemController.text = widget.problem;
    getProvider.rgenderController.text = widget.gender;
    getProvider.rdateController.text = widget.date;
    getProvider.rtimeController.text = widget.time;
  }

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<AppointmentProvider>(
      context,
    );
    final editProvider = Provider.of<UpdateProvider>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: WNormalAppBar(context),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                doctersCard(context,
                    picture: widget.doctorpic,
                    name: widget.doctorname,
                    speciality: widget.doctorspeciaility),
                SizedBox(
                  height: screenSize.width * 0.05,
                ),
                WTextformField(
                  inputformat:
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  keyboardType: TextInputType.name,
                  controller: editProvider.rnameController,
                  context,
                  label: 'Name',
                ),
                WTextformField(
                  inputformat: FilteringTextInputFormatter.digitsOnly,
                  keyboardType: TextInputType.number,
                  controller: editProvider.rphoneController,
                  context,
                  label: 'Phone',
                ),
                SizedBox(
                  height: screenSize.width * 0.04,
                ),
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
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(screenSize.width * 0.02),
                  isExpanded: true,
                  value: dropdownvalue,
                  onChanged: (String? newvalue) {
                    getProvider.changeGender(newvalue);
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
                  inputformat: FilteringTextInputFormatter.digitsOnly,
                  keyboardType: TextInputType.number,
                  controller: editProvider.rageController,
                  context,
                  label: 'Age',
                ),
                SizedBox(
                  height: screenSize.width * 0.04,
                ),
                WTextformField(
                  inputformat:
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  controller: editProvider.rproblemController,
                  keyboardType: TextInputType.text,
                  context,
                  label: 'Problem',
                ),
                SizedBox(
                  height: screenSize.width * 0.04,
                ),
                // captiontext(context, text: 'Time'),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select Time";
                    } else {
                      return null;
                    }
                  },
                  controller: editProvider.rtimeController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    suffixIcon: IconButton(
                      onPressed: () {
                        getProvider.selectTime(context);
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 0.04,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select Date";
                    } else {
                      return null;
                    }
                  },
                  controller: editProvider.rdateController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: IconButton(
                      onPressed: () {
                        getProvider.selectDate;
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
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
                    child: WElevatedButton(context, text: 'Reschedule',
                        navigator: () async {
                      if (_formKey.currentState!.validate()) {
                        await reshedule();
                      }
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> reshedule() async {
    final editProvider = Provider.of<UpdateProvider>(context, listen: false);
    final patient = PatientModel(
      index: widget.index,
      doctorname: widget.doctorname,
      doctorspecality: widget.doctorspeciaility,
      doctorpic: widget.doctorpic,
      name: editProvider.rnameController.text,
      phone: editProvider.rphoneController.text,
      age: editProvider.rageController.text,
      gender: editProvider.rgenderController.text,
      problem: editProvider.rproblemController.text,
      time: editProvider.rtimeController.text,
      date: editProvider.rdateController.text,
    );

    await Provider.of<DBAppointment>(context, listen: false)
        .updateAppointment(patient, patient.index);

    Navigator.pop(context);
  }
}
