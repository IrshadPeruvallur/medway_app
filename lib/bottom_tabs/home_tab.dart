import 'package:flutter/material.dart';
import 'package:medway_app/bottom_tabs/booking_tab.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      appBar: WAppBar(),
      body: SafeArea(
        child: Container(
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
                      WSpaceBetweenText(context, 'Upcoming Shediule', () {
                        print('object');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingTab(),
                            ));
                      }),
                      WDoctorNameCard(context,
                          name: "Dr.Jack", subtitle: 'Mentelist'),
                      SizedBox(
                        height: 20,
                      ),
                      WSpaceBetweenText(context, 'Docter Speciality ', () {}),
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
                      WSpaceBetweenText(context, 'Top Specialist', () {}),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) => doctorsList(context),
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
