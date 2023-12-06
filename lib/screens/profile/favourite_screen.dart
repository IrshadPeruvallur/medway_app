import 'package:flutter/material.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  final List doctorsName = [
    'Arun',
    'Rasheed',
    'Jameela',
    'Kadeeja',
    'Jabbar',
  ];
  final List doctorsSpeciality = [
    'Mentalist',
    'Dentist',
    'Neruon',
    'Genaral',
    'Dental',
  ];

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: 'Favourite'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: doctorsName.length,
                  itemBuilder: (context, index) => doctersCard(context,
                      picture: '',
                      name: doctorsName[index],
                      speciality: doctorsSpeciality[index])),
            ),
          ],
        ),
      ),
    );
  }
}
