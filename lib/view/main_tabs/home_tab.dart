import 'package:flutter/material.dart';
import 'package:medway_app/controller/patient_controller.dart';
import 'package:medway_app/controller/favourite_controller.dart';
import 'package:medway_app/controller/normal_controller.dart';
import 'package:medway_app/screens/appointment.dart';
import 'package:medway_app/screens/main_tabs/booking_tab.dart';
import 'package:medway_app/screens/doctors_list_pages/doctors_list.dart';
import 'package:medway_app/screens/my_appointment_screen.dart';
import 'package:medway_app/screens/settings_tabs/favourite_screen.dart';
import 'package:medway_app/screens/search/search_paitent.dart';
import 'package:medway_app/screens/widgets/small_widgets.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPatient(),
                ),
              );
            },
            icon: Icon(Icons.search),
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: Image(
          image: AssetImage('asset/medway Text.png'),
          width: screenSize.width * 0.3,
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
                      itemBuilder: (context, index) {
                        return DoctorCard(
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

  Widget DoctorCard(
      {required int index,
      required String name,
      required String speciality,
      required String imagepath}) {
    var screenSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagepath),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(screenSize.width * 0.02)),
                color: const Color.fromARGB(255, 19, 19, 19),
              ),
              height: screenSize.width * 0.2,
              width: screenSize.width * 0.15,
            ),
            title: Text(
              name,
              style: TextStyle(
                fontSize: screenSize.width * .05,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  speciality,
                  style: TextStyle(fontSize: screenSize.width * .03),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: screenSize.width * 0.05,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: IsDoctorInFvrt(name)
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_border),
              onPressed: () {
                setState(() {
                  if (IsDoctorInFvrt(name)) {
                    final snackBar = SnackBar(
                      content: Text("Doctor is already in the favorite list."),
                      backgroundColor: const Color.fromARGB(255, 116, 10, 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    onAddToFvrt(name, imagepath, speciality);
                    final snackBar = SnackBar(
                      content:
                          Text("Doctor has been added to the favorite list."),
                      backgroundColor: Color.fromARGB(255, 19, 19, 19),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: screenSize.width * .18,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Appointment(
                      index: index,
                      docterPic: imagepath,
                      docterName: name,
                      docterspeciality: speciality,
                    ),
                  ));
                },
                child: Text(
                  'Make Appointment ',
                  style: TextStyle(
                    fontSize: screenSize.width * .05,
                    color: Color.fromARGB(255, 16, 105, 140),
                  ),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenSize.width * .03),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 223, 246, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
