// ignore_for_file: dead_code, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medway_app/controller/db_providers/db_appointment.dart';
import 'package:medway_app/controller/db_providers/db_favourite.dart';
import 'package:medway_app/services/favourite_service.dart';
import 'package:medway_app/controller/normal_controller.dart';
import 'package:medway_app/services/appointment_service.dart';
import 'package:medway_app/controller/doctors_list_provider.dart';
import 'package:medway_app/controller/search_provider.dart';
import 'package:medway_app/view/appointments_pages/appointment.dart';
import 'package:medway_app/view/appointments_pages/my_appointment_screen.dart';
import 'package:medway_app/view/appointments_pages/reshedule_appointment.dart';
import 'package:medway_app/view/doctors_list_pages/doctors_list.dart';
import 'package:provider/provider.dart';

captiontext(context, {required text, required}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.003),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.040),
    ),
  );
}

WTitleText(context, {required text, required double? size, color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: MediaQuery.of(context).size.width * size!,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

WTitleTextLeft(context, {required text, required double? size, color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: MediaQuery.of(context).size.width * size!,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

WRoundButton(context, {navigator}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .15,
    height: MediaQuery.of(context).size.width * 0.15,
    child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              const MaterialStatePropertyAll(Color.fromARGB(255, 16, 105, 140)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))),
      onPressed: () {
        navigator;
      },
      child: Icon(
        Icons.arrow_forward_ios,
        size: MediaQuery.of(context).size.width * .06,
      ),
    ),
  );
}

Widget WTextformField(
  BuildContext context, {
  prificsText,
  maxlength,
  required TextInputFormatter inputformat,
  required String label,
  String? hint,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // captiontext(
        //   context,
        //   text: label,
        // ),
        SizedBox(height: MediaQuery.of(context).size.width * .01),
        SizedBox(
          height: MediaQuery.of(context).size.width * .2,
          child: TextFormField(
            maxLength: maxlength,
            inputFormatters: [inputformat],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter $label";
              } else {
                return null;
              }
            },
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              prefixText: prificsText,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 16, 105, 140),
                ),
              ),
              labelText: label,
              labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * .04,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget WElevatedButton(BuildContext context,
    {String? text, VoidCallback? navigator}) {
  var screenSize = MediaQuery.of(context).size;
  return SizedBox(
    width: screenSize.width * .7,
    height: screenSize.width * .13,
    child: ElevatedButton(
      onPressed: () {
        navigator!();
      },
      child: Text(
        text!,
        style: TextStyle(fontSize: screenSize.width * .05),
      ),
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenSize.width * .04),
        )),
        backgroundColor: const MaterialStatePropertyAll(
          Color.fromARGB(255, 16, 105, 140),
        ),
      ),
    ),
  );
}

Widget WDoctorNameCard(context,
    {required name, required subtitle, date, time, picture}) {
  var screenSize = MediaQuery.of(context).size;
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenSize.width * 0.03)),
    color: const Color.fromARGB(255, 16, 105, 140),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
              title: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * .05,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: screenSize.width * 0.04),
              ),
              trailing: Icon(
                size: screenSize.width * 0.08,
                Icons.call_rounded,
                color: Colors.white,
              ),
              // minLeadingWidth: screenSize.width * .2,
              leading: CircleAvatar(
                radius: screenSize.width * .08,
                backgroundImage: AssetImage(picture),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 6, 15, 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenSize.width * .02)),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: screenSize.width * 0.05,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.02,
                    ),
                    captiontext(context, text: date),
                    SizedBox(
                      width: screenSize.width * 0.08,
                    ),
                    Icon(
                      Icons.timer_sharp,
                      size: screenSize.width * 0.05,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.02,
                    ),
                    captiontext(context, text: time),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget WSpecialistCircle(context, imagepath) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DoctorsList(),
          ));
    },
    child: CircleAvatar(
      radius: MediaQuery.of(context).size.width * .09,
      backgroundColor: const Color.fromARGB(210, 223, 245, 255),
      backgroundImage: AssetImage(
        imagepath,
      ),
    ),
  );
}

Widget WSpaceBetweenText(context, {text, required VoidCallback navigator}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    WTitleText(
      context,
      text: text,
      size: 0.06,
    ),
    TextButton(
        onPressed: () {
          navigator();
        },
        child: const Text('See All'))
  ]);
}

Widget doctorsList(
  BuildContext context, {
  required String name,
  required String speciality,
  required String imagepath,
  required int index,
}) {
  var screenSize = MediaQuery.of(context).size;
  final getProvider = Provider.of<DBFavourite>(context);
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
              borderRadius:
                  BorderRadius.all(Radius.circular(screenSize.width * 0.02)),
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
          trailing: Consumer<DBFavourite>(builder: (context, value, child) {
            return IconButton(
              icon: value.IsDoctorInFvrt(name)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                if (value.IsDoctorInFvrt(name)) {
                  value.deleterFromFvrt(index);
                  const snackBar = SnackBar(
                    content:
                        Text("Doctor has been removed from the favorite list"),
                    backgroundColor: Color.fromARGB(255, 116, 10, 2),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  onAddToFvrt(name, imagepath, speciality, context);
                  // ignore: prefer_const_declarations
                  final snackBar = const SnackBar(
                    content: Text("Doctor has been added to the favorite list"),
                    backgroundColor: Color.fromARGB(255, 19, 19, 19),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            );
          }),
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
                  borderRadius: BorderRadius.circular(screenSize.width * .03),
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
  );
}

Widget doctersCard(context,
    {required name, required speciality, required picture}) {
  var screenSize = MediaQuery.of(context).size;
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(screenSize.width * 0.04))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(picture)),
                borderRadius: BorderRadius.circular(screenSize.width * .05),
                color: const Color.fromARGB(255, 97, 97, 97),
              ),
              height: screenSize.width * 0.3,
              width: screenSize.width * 0.25,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: screenSize.width * 0.05,
                    color: const Color.fromARGB(255, 255, 199, 59),
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width * .5,
                child: WTitleTextLeft(context, text: name, size: 0.05),
              ),
              captiontext(context, text: speciality),
            ],
          )
        ],
      ),
    ),
  );
}

doubleText(context, {text1, text2}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        captiontext(context, text: text1),
        captiontext(context, text: text2)
      ],
    ),
  );
}

// wDropDown(items) {
//   return DropdownButtonFormField(
//     decoration: InputDecoration(
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             borderSide: BorderSide(color: Color.fromARGB(255, 16, 105, 140))),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10)))),
//     value: items[0],
//     items: items.map((String value) {
//       return DropdownMenuItem<String>(
//         value: value,
//         child: Text(value),
//       );
//     }).toList(),
//     onChanged: (value) {},
//   );
// }

WshowBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
                onTap: () {
                  // Handle gallery option
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  // Handle camera option
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('Cancel'),
                onTap: () {
                  // Close the bottom sheet
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      });
}

appointmentCard(data, context, index) {
  var screenSize = MediaQuery.of(context).size;
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenSize.width * .03)),
    color: const Color.fromARGB(255, 255, 255, 255),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          captiontext(context, text: '${data.date} | ${data.time}'),
          const Divider(
            color: Colors.black,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAppointment(
                        index: index,
                        doctorspicture: data.doctorpic,
                        doctorname: data.doctorname,
                        doctorspeciality: data.doctorspecality,
                        name: data.name,
                        age: data.age,
                        gender: data.gender,
                        phone: data.phone,
                        problem: data.problem,
                        date: data.date,
                        time: data.time),
                  ));
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(data.doctorpic)),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 97, 97, 97),
                    ),
                    height: 120,
                    width: 100,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: List.generate(
                    //     5,
                    //     (index) => Icon(
                    //       Icons.star,
                    //       size: screenSize.width * 0.05,
                    //       color: const Color.fromARGB(
                    //           255, 255, 199, 59),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      child: WTitleTextLeft(context,
                          text: data.doctorname, size: 0.05),
                      width: screenSize.width * 0.55,
                    ),
                    captiontext(context, text: data.doctorspecality),
                    captiontext(context, text: data.name),
                    captiontext(context, text: 'Booking id:MDWY00${index + 1}'),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 16, 105, 140)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 5)))),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(screenSize.width * 0.05))),
                          title: Column(
                            children: [
                              WTitleText(
                                context,
                                text: 'Cancel',
                                size: 0.05,
                              ),
                              captiontext(context,
                                  text:
                                      '''Are you sure you want to cancel the Appointment? ''')
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  Provider.of<DBAppointment>(context)
                                      .cancelAppointment(index);
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes, Cancel")),
                          ],
                        ),
                      );
                    },
                    child: const Text('Cancel')),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 16, 105, 140)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenSize.width * 5)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReSheduleAppointment(
                                index: index,
                                doctorname: data.doctorname,
                                doctorpic: data.doctorpic,
                                doctorspeciaility: data.doctorspecality,
                                name: data.name,
                                age: data.age,
                                phone: data.phone,
                                gender: data.gender,
                                problem: data.problem,
                                date: data.date,
                                time: data.time),
                          ));
                    },
                    child: const Text('Reshedule')),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget DoctorCard(context,
    {required int index,
    required String name,
    required String speciality,
    required String imagepath}) {
  var screenSize = MediaQuery.of(context).size;
  final getProvider = Provider.of<DoctorsListProvider>(context, listen: false);
  print("Print DoctorCard");
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagepath),
                fit: BoxFit.cover,
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(screenSize.width * 0.02)),
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
          trailing:
              Consumer<DoctorsListProvider>(builder: (context, value, child) {
            print("Print Fvrt");
            return IconButton(
              icon: value.iconColor(name, context),
              onPressed: () {
                getProvider.toFvrt(
                    context: context,
                    imagepath: imagepath,
                    name: name,
                    speciality: speciality);
              },
            );
          }),
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
              child: Text(
                'Make Appointment ',
                style: TextStyle(
                  fontSize: screenSize.width * .05,
                  color: Color.fromARGB(255, 16, 105, 140),
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * .03),
                )),
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 223, 246, 255),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
