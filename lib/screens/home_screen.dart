import 'package:flutter/material.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
        ),
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        foregroundColor: Color.fromARGB(255, 16, 105, 140),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenSize.width * .05,
            ),
            WSpaceBetweenText(context, 'Upcoming Shediule', () {}),
            WDoctorNameCard(context, name: "Dr.Jack", subtitle: 'Mentelist'),
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
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => doctorsList(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
