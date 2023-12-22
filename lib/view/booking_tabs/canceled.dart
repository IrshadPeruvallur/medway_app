import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:medway_app/controller/functions/cancel_controller.dart';
import 'package:medway_app/view/appointments_pages/complete_cancel_appointment.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';

class CanceledTab extends StatelessWidget {
  const CanceledTab({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    getAllCanceld();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: cancelNotifierList,
              builder: (context, value, child) {
                return value.isEmpty
                    ? Center(
                        child: Lottie.asset('asset/empty.json'),
                      )
                    : Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 15,
                                ),
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              final data = value[index];
                              return Slidable(
                                startActionPane: ActionPane(
                                    motion: StretchMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          deleteFromCanceld(index);
                                        },
                                        icon: Icons.delete_forever,
                                      )
                                    ]),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CancelAppointment(
                                            index: index,
                                            doctorname: data.doctorname,
                                            doctorspeciality:
                                                data.doctorspecality,
                                            doctorspicture: data.doctorpic,
                                            name: data.name,
                                            gender: data.gender,
                                            phone: data.phone,
                                            age: data.age,
                                            problem: data.problem,
                                            date: data.date,
                                            time: data.time),
                                      )),
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            screenSize.width * .03)),
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          captiontext(context,
                                              text:
                                                  '${data.date}  |  ${data.time}'),
                                          Divider(
                                            color: Colors.black,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            data.doctorpic)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: List.generate(
                                                      5,
                                                      (index) => Icon(
                                                        Icons.star,
                                                        size: screenSize.width *
                                                            0.05,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 255, 199, 59),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    child: WTitleTextLeft(
                                                      context,
                                                      text: data.doctorname,
                                                      size: 0.05,
                                                    ),
                                                    width:
                                                        screenSize.width * 0.55,
                                                  ),
                                                  captiontext(context,
                                                      text:
                                                          data.doctorspecality),
                                                  captiontext(context,
                                                      text:
                                                          'Patient : ${data.name}'),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
              },
            ),
          ],
        ));
  }
}
