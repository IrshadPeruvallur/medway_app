import 'package:flutter/material.dart';
import 'package:medway_app/controller/db_providers/db_favourite.dart';
import 'package:medway_app/controller/normal_controller.dart';
import 'package:provider/provider.dart';

class DoctorsListProvider extends ChangeNotifier {
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
  String serchedList = '';
  void valueToLowerCase(String value) {
    serchedList = value.toLowerCase();
    notifyListeners();
  }

  void toFvrt({context, name, imagepath, speciality}) {
    if (Provider.of<DBFavourite>(context, listen: false).IsDoctorInFvrt(name)) {
      const snackBar = SnackBar(
        content: Text("Doctor is already in the favorite list."),
        backgroundColor: Color.fromARGB(255, 116, 10, 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      onAddToFvrt(name, imagepath, speciality, context);
      const snackBar = SnackBar(
        content: Text("Doctor has been added to the favorite list."),
        backgroundColor: Color.fromARGB(255, 19, 19, 19),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    notifyListeners();
  }

  Widget iconColor(name, context) {
    return Provider.of<DBFavourite>(context).IsDoctorInFvrt(name)
        ? const Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : const Icon(Icons.favorite_border);
  }
}
