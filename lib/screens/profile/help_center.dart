import 'package:flutter/material.dart';
import 'package:medway_app/screens/doctors_list.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class HelpCenter extends StatelessWidget {
  HelpCenter({super.key});

  final List text = [
    'How do I schedule an appointment?',
    'Can I reschedule or cancel appointments?',
    'How do I receive appointment reminders?',
    'How to Checked Pre-Booked Appointment?',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: 'Favourite'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: ListView.separated(
              // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: text.length,
              itemBuilder: (context, index) => Card(
                  child: ListTile(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => text[index],
                  //     ));
                },
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: WTitleText(context, text: text[index], size: 0.04),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: screenSize.width * 0.05,
                ),
              )),
            ),
          )
        ]),
      ),
    );
  }
}
