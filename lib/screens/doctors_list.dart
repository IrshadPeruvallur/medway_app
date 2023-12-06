import 'package:flutter/material.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class DoctorsList extends StatelessWidget {
  DoctorsList({super.key});
  final List doctorsSpeciality = [
    'Cardiology',
    'Neurosurgery',
    'Pediatric Oncology',
    'Dermatology',
    'Gastroenterology',
    'Rheumatology',
    'Orthopedic Surgery',
    'Nephrology',
    'Pulmonology',
    'Endocrinology',
    'Hematology',
    'Ophthalmology',
    'Urology',
    'Infectious Disease',
    'Gynecologic Oncology',
    'Neonatology',
    'Geriatrics',
    'Plastic Surgery',
    'Allergy and Immunology',
    'Sports Medicine',
  ];
  final List doctorsname = [
    'Dr. Emily Mitchell - MBBS, ',
    'Dr. Ethan Reynolds - MBChB,',
    'Dr. Olivia Carter - MD, PhD ',
    'Dr. Benjamin Taylor - DO, MS ',
    'Dr. Ava Richardson - DMD, DDS',
    'Dr. Noah Williams - MBBS, DC',
    'Dr. Grace Turner - MD, MPH ',
    'Dr. Elijah Thompson - DVM, PhD',
    'Dr. Isabella Parker - MBBS, MRCOG ',
    'Dr. Lucas Turner - OD, MS',
    'Dr. Mia Foster - DPT, OCS ',
    'Dr. Samuel Wright - PharmD, BCP',
    'Dr. Lily Martinez - DPM, FACFAS ',
    'Dr. Henry Adams - PsyD ',
    'Dr. Scarlett Clark - DDS, MSD ',
    'Dr. Caleb Scott - DSc, MPH ',
    'Dr. Zoey Ward - MD, MS ',
    'Dr. Nathan Brown - PharmD, MBA ',
    'Dr. Stella Turner - MD, DM',
    'Dr. Oliver Lewis - DPT, CSCS ',
  ];
  final List doctersimage = [
    'asset/d1.jpg',
    'asset/d2.jpg',
    'asset/d3.jpg',
    'asset/d4.png',
    'asset/d5.jpg',
    'asset/d6.jpg',
    'asset/d7.jpg',
    'asset/d8.jpg',
    'asset/d9.jpg',
    'asset/d10.png',
    'asset/d1.jpg',
    'asset/d2.jpg',
    'asset/d3.jpg',
    'asset/d4.png',
    'asset/d5.jpg',
    'asset/d6.jpg',
    'asset/d7.jpg',
    'asset/d8.jpg',
    'asset/d9.jpg',
    'asset/d10.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WNormalAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: doctorsname.length,
              itemBuilder: (context, index) => doctorsList(context,
                  imagepath: doctersimage[index],
                  name: doctorsname[index],
                  speciality: doctorsSpeciality[index]),
            ),
          )
        ],
      ),
    );
  }
}
