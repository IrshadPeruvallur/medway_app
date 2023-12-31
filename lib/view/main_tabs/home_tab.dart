// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:medway_app/controller/db_providers/db_appointment.dart';
import 'package:medway_app/view/appointments_pages/my_appointment_screen.dart';
import 'package:medway_app/view/main_tabs/booking_tab.dart';
import 'package:medway_app/view/doctors_list_pages/doctors_list.dart';
import 'package:medway_app/view/settings_tabs/favourite_screen.dart';
import 'package:medway_app/view/search/search_paitent.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  HomeTab({Key? key});

  List<String> doctorsName = [
    'Dr. Emily Mitchell - MBBS, ',
    'Dr. Ethan Reynolds - MBChB,',
    'Dr. Olivia Carter - MD, PhD ',
  ];

  List<String> doctorSpeciality = [
    'Cardiology',
    'Neurosurgery',
    'Pediatric Oncology',
  ];

  final List doctersimage = [
    'asset/d1.jpg',
    'asset/d2.jpg',
    'asset/d3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 60,
        leading: const Image(
          image: AssetImage('asset/medcalway-white-logo.png'),
          width: 20,
          color: Color.fromARGB(255, 16, 105, 140),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouriteScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite_outline),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPatient(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: Image(
          image: const AssetImage('asset/medway Text.png'),
          width: screenSize.width * 0.3,
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 16, 105, 140),
      ),
      body: SafeArea(
        child: Container(
          height: screenSize.height * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/background.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenSize.width * .05),
                  Container(
                    // height: screenSize.width * 0.4,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Consumer<DBAppointment>(
                          // valueListenable: patientListNotifier,
                          builder: (context, value, child) {
                            if (value.patientList.isEmpty) {
                              return const SizedBox(
                                width: double.infinity,
                                // height: screenSize.width * .3,
                                child: Image(
                                  image: AssetImage('asset/Hospital-HITN.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              );
                            }

                            final data =
                                value.patientList[value.patientList.length - 1];
                            return Column(
                              children: [
                                WSpaceBetweenText(
                                  context,
                                  text: 'Upcoming Schedule',
                                  navigator: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BookingTab(),
                                      ),
                                    );
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MyAppointment(
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
                                                time: data.time)));
                                  },
                                  child: WDoctorNameCard(
                                    context,
                                    picture: data.doctorpic,
                                    name: data.doctorname,
                                    subtitle: data.doctorspecality,
                                    date: data.date,
                                    time: data.time,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  WSpaceBetweenText(
                    context,
                    text: 'Doctor Speciality',
                    navigator: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorsList(),
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WSpecialistCircle(context, 'asset/dental.png'),
                      WSpecialistCircle(context, 'asset/ell.png'),
                      WSpecialistCircle(context, 'asset/heart.png'),
                      WSpecialistCircle(context, 'asset/neuron.png'),
                    ],
                  ),
                  SizedBox(height: screenSize.width * 0.02),
                  WSpaceBetweenText(
                    context,
                    text: 'Top Specialist',
                    navigator: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const DoctorsList();
                      }));
                    },
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: doctorsName.length,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          context,
                          index: index,
                          imagepath: doctersimage[index],
                          name: doctorsName[index],
                          speciality: doctorSpeciality[index],
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
