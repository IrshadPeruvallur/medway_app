import 'package:flutter/material.dart';
import 'package:medway_app/function/db_function.dart';
import 'package:medway_app/screens/my_appointment_screen.dart';
import 'package:medway_app/screens/reshedule_appointment.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class UpComingTab extends StatelessWidget {
  const UpComingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: patientListNotifier,
            builder: (context, patientList, child) {
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: patientList.length,
                  itemBuilder: (context, index) {
                    final revesedIndex = patientList.length - 1 - index;
                    final data = patientList[revesedIndex];
                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenSize.width * .03)),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            captiontext(context,
                                text: '${data.date} | ${data.time}'),
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
                                          doctorspeciality:
                                              data.doctorspecality,
                                          name: data.name,
                                          age: data.age,
                                          gender: data.gender,
                                          phone: data.phone,
                                          problem: data.problem,
                                          date: data.date,
                                          time: data.time),
                                    ));
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(data.doctorpic)),
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
                                      // Row(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   children: List.generate(
                                      //     5,
                                      //     (index) => Icon(
                                      //       Icons.star,
                                      //       size: screenSize.width * 0.05,
                                      //       color: const Color.fromARGB(
                                      //           255, 255, 199, 59),
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        child: WTitleTextLeft(context,
                                            text: data.doctorname, size: 0.05),
                                        width: screenSize.width * 0.55,
                                      ),
                                      captiontext(context,
                                          text: data.doctorspecality),
                                      captiontext(context, text: data.name),
                                      captiontext(context,
                                          text:
                                              'Booking id:MDWY00${index + 1}'),
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
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      255, 16, 105, 140)),
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          screenSize.width *
                                                              5)))),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        screenSize.width *
                                                            0.05))),
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
                                                  child: Text("Cancel")),
                                              TextButton(
                                                  onPressed: () {
                                                    cancelAppointment(index);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Yes, Cancel")),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Text('Cancel')),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      255, 16, 105, 140)),
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          screenSize.width *
                                                              5)))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ReSheduleAppointment(
                                                      index: index,
                                                      doctorname:
                                                          data.doctorname,
                                                      doctorpic: data.doctorpic,
                                                      doctorspeciaility:
                                                          data.doctorspecality,
                                                      name: data.name,
                                                      age: data.age,
                                                      phone: data.phone,
                                                      gender: data.gender,
                                                      problem: data.problem,
                                                      date: data.date,
                                                      time: data.time),
                                            ));
                                      },
                                      child: Text('Reshedule')),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
