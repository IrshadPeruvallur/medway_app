import 'package:flutter/material.dart';
import 'package:medway_app/screens/doctors_list.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class HelpCenter extends StatelessWidget {
  HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: 'Favourite'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          WTitleText(context, text: 'Cancalation Policy', size: 0.05),
        ]),
      ),
    );
  }
}
