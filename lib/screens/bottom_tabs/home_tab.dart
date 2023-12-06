import 'package:flutter/material.dart';
import 'package:medway_app/function/db_function.dart';
import 'package:medway_app/screens/bottom_tabs/booking_tab.dart';
import 'package:medway_app/screens/doctors_list.dart';
import 'package:medway_app/screens/my_appointment_screen.dart';
import 'package:medway_app/screens/profile/favourite_screen.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key});

  List<String> doctorsName = [
    'Dr. Ethan Reynolds - MBChB,',
    'Dr. Olivia Carter - MD, PhD ',
    'Dr. Benjamin Taylor - DO, MS ',
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
        leading: Image(
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
                  builder: (context) => FavouriteScreen(),
                ),
              );
            },
            icon: Icon(Icons.favorite_outline),
          )
        ],
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 16, 105, 140),
      ),
      body: SafeArea(
        child: Container(
          height: screenSize.height * 1,
          decoration: BoxDecoration(
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
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ValueListenableBuilder(
                          valueListenable: patientListNotifier,
                          builder: (context, patientList, child) {
                            if (patientList.isEmpty) {
                              return SizedBox(
                                width: double.infinity,
                                // height: screenSize.width * .3,
                                child: Image(
                                  image: AssetImage('asset/Hospital-HITN.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              );
                            }

                            final data = patientList[patientList.length - 1];
                            return Column(
                              children: [
                                WSpaceBetweenText(
                                  context,
                                  text: 'Upcoming Schedule',
                                  navigator: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookingTab(),
                                      ),
                                    );
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (context) => MyAppointment(),
                                    // ));
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
                  SizedBox(height: 20),
                  WSpaceBetweenText(
                    context,
                    text: 'Doctor Speciality',
                    navigator: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorsList(),
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
                        return DoctorsList();
                      }));
                    },
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctorsName.length,
                    itemBuilder: (context, index) => doctorsList(
                      context,
                      imagepath: doctersimage[index],
                      name: doctorsName[index],
                      speciality: doctorSpeciality[index],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
