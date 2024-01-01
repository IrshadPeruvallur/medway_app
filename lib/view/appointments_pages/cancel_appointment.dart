import 'package:flutter/material.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';

// ignore: must_be_immutable
class CancelAppointment extends StatelessWidget {
  CancelAppointment(
      {super.key,
      required this.index,
      required this.doctorname,
      required this.doctorspeciality,
      required this.doctorspicture,
      required this.name,
      required this.gender,
      required this.phone,
      required this.age,
      required this.problem,
      required this.date,
      required this.time});
  int index;
  final String doctorname;
  final String doctorspeciality;
  final String name;
  final String doctorspicture;

  final String gender;
  final String phone;
  final String age;
  final String problem;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: "My Appointment"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              doctersCard(context,
                  name: doctorname,
                  speciality: doctorspeciality,
                  picture: doctorspicture),
              const Divider(
                color: Colors.black,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(screenSize.width * 0.04))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WTitleText(context, text: 'Patient Info.', size: 0.05),
                      doubleText(context, text1: 'Full Name', text2: name),
                      doubleText(context, text1: 'Mobile Number', text2: phone),
                      doubleText(context, text1: 'Gender', text2: gender),
                      doubleText(context, text1: 'Age', text2: age),
                      doubleText(context, text1: 'Problem', text2: problem),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.width * 0.04,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(screenSize.width * 0.04))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WTitleText(context,
                          text: 'Scheduled Appointment', size: 0.05),
                      doubleText(context, text1: 'Date', text2: date),
                      doubleText(context, text1: 'Time', text2: time),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
