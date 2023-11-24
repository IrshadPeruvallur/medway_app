import 'package:flutter/material.dart';
import 'package:medway_app/screens/onboarding/onboard_screen_1.dart';
import 'package:medway_app/widgets/text_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 105, 140),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  titleText(context,
                      text: 'Your Ultimate Doctor Appointment Booking App',
                      size: .07,
                      color: Color.fromARGB(255, 16, 105, 140)),
                  SizedBox(
                    height: 20,
                  ),
                  captiontext(
                    context,
                    text:
                        'Book appointments effortlessly and manage your health journey',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: screenSize.width * .7,
                    height: screenSize.width * .13,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnboardScreen1(),
                              ));
                        },
                        child: Text(
                          '''Let's Gets Start''',
                          style: TextStyle(fontSize: screenSize.width * .05),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        screenSize.width * .04))),
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 16, 105, 140),
                            ))),
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
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
