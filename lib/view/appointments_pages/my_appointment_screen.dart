// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:medway_app/controller/db_providers/db_appointment.dart';
import 'package:medway_app/view/appointments_pages/reshedule_appointment.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyAppointment extends StatelessWidget {
  MyAppointment(
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 16, 105, 140)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          screenSize.width * 5)))),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            screenSize.width * 0.05))),
                                title: Column(
                                  children: [
                                    WTitleText(
                                      context,
                                      text: 'Cancel',
                                      size: 0.05,
                                    ),
                                    captiontext(context,
                                        text:
                                            '''Are you sure you want to cancel the Appointment? ''')
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel")),
                                  TextButton(
                                      onPressed: () async {
                                        await Provider.of<DBAppointment>(
                                                context,
                                                listen: false)
                                            .cancelAppointment(index);

                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Appointment canceled successfully!'),
                                          ),
                                        );
                                      },
                                      child: const Text("Yes, Cancel")),
                                ],
                              ),
                            );
                          },
                          child: const Text('Cancel')),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 16, 105, 140)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          screenSize.width * 5)))),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ReSheduleAppointment(
                                    index: index,
                                    doctorname: doctorname,
                                    doctorpic: doctorspicture,
                                    doctorspeciaility: doctorspeciality,
                                    name: name,
                                    age: age,
                                    phone: phone,
                                    gender: gender,
                                    problem: problem,
                                    date: date,
                                    time: time);
                              },
                            ));
                          },
                          child: const Text('Reshedule')),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
