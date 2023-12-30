import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medway_app/controller/db_providers/db_appointment.dart';
import 'package:medway_app/controller/db_providers/db_cancel.dart';
import 'package:medway_app/model/cancel_model/canceled_model.dart';
import 'package:medway_app/services/cancel_service.dart';
import 'package:medway_app/services/normal_service.dart';
import 'package:medway_app/services/appointment_service.dart';
import 'package:medway_app/view/appointments_pages/my_appointment_screen.dart';
import 'package:medway_app/view/appointments_pages/reshedule_appointment.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';
import 'package:provider/provider.dart';

class UpComingTab extends StatelessWidget {
  const UpComingTab({Key? key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<DBAppointment>(
            // child: ValueListenableBuilder(
            //   valueListenable: patientListNotifier,

            builder: (context, value, child) {
          final consumervalue = value.patientList;
          return value.patientList.isEmpty
              ? Lottie.asset('asset/empty.json')
              : ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: consumervalue.length,
                  itemBuilder: (context, index) {
                    // final reversedIndex = patientList.length - 1 - index;
                    final data = consumervalue[index];
                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(screenSize.width * .03),
                      ),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            captiontext(
                              context,
                              text: '${data.time} | ${data.time}',
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyAppointment(
                                      index: index,
                                      doctorspicture: data.doctorpic,
                                      doctorname: data.doctorname,
                                      doctorspeciality: data.doctorspecality,
                                      name: data.name,
                                      age: data.age,
                                      gender: data.gender,
                                      phone: data.phone,
                                      problem: data.problem,
                                      date: data.date,
                                      time: data.time,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(data.doctorpic),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 97, 97, 97),
                                      ),
                                      height: 120,
                                      width: 100,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: WTitleTextLeft(
                                          context,
                                          text: data.doctorname,
                                          size: 0.05,
                                        ),
                                        width: screenSize.width * 0.55,
                                      ),
                                      captiontext(
                                        context,
                                        text: data.doctorspecality,
                                      ),
                                      captiontext(context, text: data.name),
                                      captiontext(
                                        context,
                                        text: 'Booking id:MDWY00${index + 1}',
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 16, 105, 140),
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              screenSize.width * 5),
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  screenSize.width * 0.05),
                                            ),
                                          ),
                                          title: Column(
                                            children: [
                                              WTitleText(
                                                context,
                                                text: 'Cancel',
                                                size: 0.05,
                                              ),
                                              captiontext(
                                                context,
                                                text:
                                                    'Are you sure you want to cancel the Appointment?',
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                try {
                                                  final addCancel =
                                                      CanceldModel(
                                                    doctorname: data.doctorname,
                                                    doctorspecality:
                                                        data.doctorspecality,
                                                    doctorpic: data.doctorpic,
                                                    name: data.name,
                                                    phone: data.phone,
                                                    age: data.age,
                                                    gender: data.gender,
                                                    problem: data.problem,
                                                    time: data.time,
                                                    date: data.date,
                                                  );
                                                  Provider.of<DbCancel>(context,
                                                          listen: false)
                                                      .addCanceled(addCancel);

                                                  await Provider.of<
                                                              DBAppointment>(
                                                          context,
                                                          listen: false)
                                                      .cancelAppointment(index);
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Appointment canceled successfully!'),
                                                    ),
                                                  );
                                                } catch (error) {
                                                  print(
                                                      "Error canceling appointment: $error");
                                                  Navigator.pop(
                                                      context); // Close the dialog
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Failed to cancel appointment. Please try again.'),
                                                    ),
                                                  );
                                                }
                                              },
                                              child: Text("Yes, Cancel"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 16, 105, 140),
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              screenSize.width * 5),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ReSheduleAppointment(
                                            index: index,
                                            doctorname: data.doctorname,
                                            doctorpic: data.doctorpic,
                                            doctorspeciaility:
                                                data.doctorspecality,
                                            name: data.name,
                                            age: data.age,
                                            phone: data.phone,
                                            gender: data.gender,
                                            problem: data.problem,
                                            date: data.date,
                                            time: data.time,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('Reschedule'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
        }));
    // );
  }
}
