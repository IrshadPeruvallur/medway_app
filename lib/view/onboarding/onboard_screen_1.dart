import 'package:flutter/material.dart';
import 'package:medway_app/view/onboarding/onboard_screen_2.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage('asset/MED_prescription_preview.jpg'),
                width: double.infinity,
              ),
              SizedBox(
                height: screenSize.width * .1,
              ),
              WTitleText(
                context,
                text: 'Discover Experienced Doctors',
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
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .15,
            height: MediaQuery.of(context).size.width * 0.15,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 16, 105, 140)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(screenSize.width * 0.5)))),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OnboardScreen2()));
              },
              child: Icon(
                Icons.arrow_forward_ios,
                size: MediaQuery.of(context).size.width * .05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
