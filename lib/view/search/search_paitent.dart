import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:medway_app/controller/functions/patient_controller.dart';
import 'package:medway_app/model/patient_model/patient_model.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({Key? key}) : super(key: key);

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  List<PatientModel> _searchedPatient = [];

  loadFood() async {
    final allfood = patientListNotifier.value;
    setState(() {
      _searchedPatient = allfood;
    });
  }

  _filter(String enteredName) {
    List<PatientModel> result = [];

    if (enteredName.isEmpty) {
      result = patientListNotifier.value;
    } else {
      result = patientListNotifier.value
          .where((PatientModel patient) =>
              patient.name.toLowerCase().contains(enteredName.toLowerCase()))
          .toList();
    }

    setState(() {
      _searchedPatient = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar(title: 'Search'),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/background.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                onChanged: (value) => _filter(value),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 16, 105, 140),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.search_sharp,
                    color: Color.fromARGB(255, 16, 105, 140),
                  ),
                  hintText: "Find  Appointment...",
                  hintStyle: const TextStyle(
                    color: Color(0xFF636262),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: _searchedPatient.isEmpty
                  ? Center(
                      child:
                          Lottie.asset("asset/Animation - 1702105823848.json"),
                    )
                  : ListView.builder(
                      itemCount: _searchedPatient.length,
                      itemBuilder: (context, index) {
                        final data = _searchedPatient[index];
                        return appointmentCard(data, context, index);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
