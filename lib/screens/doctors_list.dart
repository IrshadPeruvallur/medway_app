import 'package:flutter/material.dart';
import 'package:medway_app/function/favourite_db_function.dart';
import 'package:medway_app/function/nrml_function.dart';
import 'package:medway_app/screens/appointment.dart';
import 'package:medway_app/widgets/main_widgets.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({super.key});

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar(title: "Doctors List"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  serchedList = value.toLowerCase();
                });
              },
              decoration: const InputDecoration(
                focusColor: Color.fromARGB(255, 16, 105, 140),
                hintText: 'Search doctors...',
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 16, 105, 140),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctorsname.length,
              itemBuilder: (context, index) {
                if (doctorsname[index].toLowerCase().contains(serchedList) ||
                    doctorsSpeciality[index]
                        .toLowerCase()
                        .contains(serchedList)) {
                  return DoctorCard(
                    index: index,
                    imagepath: doctersimage[index],
                    name: doctorsname[index],
                    speciality: doctorsSpeciality[index],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DoctorCard(
      {required int index,
      required String name,
      required String speciality,
      required String imagepath}) {
    var screenSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagepath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(screenSize.width * 0.02)),
                  color: const Color.fromARGB(255, 19, 19, 19),
                ),
                height: screenSize.width * 0.2,
                width: screenSize.width * 0.15,
              ),
              title: Text(
                name,
                style: TextStyle(
                  fontSize: screenSize.width * .05,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    speciality,
                    style: TextStyle(fontSize: screenSize.width * .03),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: screenSize.width * 0.05,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: IsDoctorInFvrt(name)
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    if (IsDoctorInFvrt(name)) {
                      // deleteFromFvrt(index);
                      const snackBar = SnackBar(
                        content:
                            Text("Doctor is already in the favorite list."),
                        backgroundColor: Color.fromARGB(255, 116, 10, 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      onAddToFvrt(name, imagepath, speciality);
                      const snackBar = SnackBar(
                        content:
                            Text("Doctor has been added to the favorite list."),
                        backgroundColor: Color.fromARGB(255, 19, 19, 19),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: screenSize.width * .18,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Appointment(
                        index: index,
                        docterPic: imagepath,
                        docterName: name,
                        docterspeciality: speciality,
                      ),
                    ));
                  },
                  // ignore: sort_child_properties_last
                  child: Text(
                    'Make Appointment ',
                    style: TextStyle(
                      fontSize: screenSize.width * .05,
                      color: const Color.fromARGB(255, 16, 105, 140),
                    ),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(screenSize.width * .03),
                    )),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 223, 246, 255),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
