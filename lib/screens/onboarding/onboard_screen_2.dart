import 'package:flutter/material.dart';
import 'package:medway_app/screens/onboarding/onboard_screen_3.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class OnboardScreen2 extends StatelessWidget {
  const OnboardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image(
                  image: AssetImage('asset/istockphoto-1333890585-612x612.jpg'),
                  width: double.infinity,
                ),
                SizedBox(
                  height: screenSize.width * .1,
                ),
                WTitleText(
                  context,
                  text: 'Effortless Appointment Booking',
                  size: 0.08,
                ),
                SizedBox(
                  height: screenSize.width * .05,
                ),
                captiontext(
                  context,
                  text:
                      'Book appointments effortlessly and manage your health journey',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 16, 105, 140)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: MediaQuery.of(context).size.width * .05,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 16, 105, 140)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OnboardScreen3()));
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: MediaQuery.of(context).size.width * .05,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}