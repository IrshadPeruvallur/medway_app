import 'package:flutter/material.dart';
import 'package:medway_app/bottom_tabs/booking_tab.dart';
import 'package:medway_app/screens/doctors_list.dart';
import 'package:medway_app/screens/my_appointment_screen.dart';
import 'package:medway_app/screens/profile/favourite_screen.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  List doctosname = ['Rahul', 'Shareef', 'Muneer'];
  List doctorspeciality = ['Mentalist', 'Dentalist', 'Neurology'];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 60,
        // automaticallyImplyLeading: false,
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
                    ));
              },
              icon: Icon(Icons.favorite_outline))
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.width * .05,
                      ),
                      WSpaceBetweenText(context, text: 'Upcoming Shediule',
                          navigator: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingTab(),
                            ));
                      }),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyAppointment(),
                          ));
                        },
                        child: WDoctorNameCard(context,
                            name: "Dr.Jack", subtitle: 'Mentelist'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WSpaceBetweenText(context, text: 'Docter Speciality ',
                          navigator: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorsList(),
                            ));
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WSpecialistCircle(context, 'asset/dental.png'),
                          WSpecialistCircle(context, 'asset/ell.png'),
                          WSpecialistCircle(context, 'asset/heart.png'),
                          WSpecialistCircle(context, 'asset/neuron.png'),
                        ],
                      ),
                      SizedBox(
                        height: screenSize.width * .02,
                      ),
                      WSpaceBetweenText(context, text: 'Top Specialist',
                          navigator: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DoctorsList();
                        }));
                      }),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: doctosname.length,
                        itemBuilder: (context, index) => doctorsList(context,
                            name: doctosname[index],
                            speciality: doctorspeciality[index]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
