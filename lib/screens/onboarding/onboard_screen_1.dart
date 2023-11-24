import 'package:flutter/material.dart';
import 'package:medway_app/widgets/text_widgets.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image(
              image: AssetImage('asset/MED_prescription_preview.jpg'),
              width: double.infinity,
            ),
            SizedBox(
              height: screenSize.width * .1,
            ),
            titleText(
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
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {}, child: Icon(Icons.arrow_forward_ios))
              ],
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.amber,
            ))
          ],
        ),
      ),
    );
  }
}
