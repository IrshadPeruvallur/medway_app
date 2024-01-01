// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:medway_app/view/onboarding/onboard_screen_1.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 105, 140),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  WTitleText(context,
                      text: 'Your Ultimate Doctor Appointment Booking App',
                      size: .07,
                      color: const Color.fromARGB(255, 16, 105, 140)),
                  const SizedBox(
                    height: 20,
                  ),
                  captiontext(
                    context,
                    text:
                        'Book appointments effortlessly and manage your health journey',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  WElevatedButton(
                    context,
                    text: '''Let's Gets Start''',
                    navigator: () =>
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const OnboardScreen1(),
                    )),
                  )
                ],
              ),
            ),
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
            color: Colors.white,
          ),
          height: screenSize.height * .4,
          width: double.infinity,
        ),
      ),
    );
  }
}
