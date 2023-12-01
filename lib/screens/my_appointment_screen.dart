import 'package:flutter/material.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: WNormalAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            doctersCard(context, name: 'name', speciality: 'speciality'),
            Divider(
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
                    doubleText(context, text1: 'Full Name', text2: 'Irshad'),
                    doubleText(context, text1: 'Gender', text2: 'Male'),
                    doubleText(context, text1: 'Age', text2: '21'),
                    doubleText(context, text1: 'Problem', text2: 'Headche'),
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
                    doubleText(context,
                        text1: 'Date', text2: 'August 24, 2023'),
                    doubleText(context, text1: 'Time', text2: '10.00-10.30'),
                    doubleText(context, text1: 'Booking For', text2: 'Self'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
