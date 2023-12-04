// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:medway_app/screens/appointment.dart';

captiontext(context, {required text, required}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.01),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.040),
    ),
  );
}

WTitleText(context, {required text, required double? size, color}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
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

WRoundButton(context, {navigator}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .15,
    height: MediaQuery.of(context).size.width * 0.15,
    child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 16, 105, 140)),
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

Widget WTextformFeild(context,
    {required label, required hint, controller, validator}) {
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        captiontext(
          context,
          text: label,
        ),
        SizedBox(height: MediaQuery.of(context).size.width * .01),
        SizedBox(
          height: MediaQuery.of(context).size.width * .2,
          child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter $label";
                } else
                  (null);
              },
              controller: controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 16, 105, 140))),
                  hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .04),
                  hintText: hint,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))))),
        )
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
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 16, 105, 140),
        ),
      ),
    ),
  );
}

Widget WDoctorNameCard(context, {required name, required subtitle}) {
  var screenSize = MediaQuery.of(context).size;
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenSize.width * 0.03)),
    color: Color.fromARGB(255, 16, 105, 140),
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
              backgroundColor: Colors.white,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: screenSize.width * 0.05,
                  ),
                  captiontext(context, text: 'Monday, 16 July'),
                  Icon(
                    Icons.timer_sharp,
                    size: screenSize.width * 0.05,
                  ),
                  captiontext(context, text: '09.00-10.00'),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget WSpecialistCircle(context, imagepath) {
  return GestureDetector(
    onTap: () {},
    child: CircleAvatar(
      radius: MediaQuery.of(context).size.width * .09,
      backgroundColor: Color.fromARGB(210, 223, 245, 255),
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
        child: Text('See All'))
  ]);
}

Widget doctorsList(context, {required name, required speciality}) {
  var screenSize = MediaQuery.of(context).size;
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
                    image: AssetImage('asset/doctor.png'), fit: BoxFit.cover),
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
                  fontWeight: FontWeight.w500),
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
                selectedIcon: Icon(Icons.favorite),
                onPressed: () {},
                icon: Icon(Icons.favorite_border))),
        SizedBox(
          width: double.infinity,
          height: screenSize.width * .18,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Appointment(),
                ));
              },
              child: Text(
                'Make Appointment ',
                style: TextStyle(
                    fontSize: screenSize.width * .05,
                    color: Color.fromARGB(255, 16, 105, 140)),
              ),
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * .03),
                )),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 223, 246, 255),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget doctersCard(context, {required name, required speciality}) {
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
                    fit: BoxFit.cover, image: AssetImage('asset/doctor.png')),
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
              WTitleText(context, text: name, size: 0.05),
              captiontext(context, text: speciality),
              captiontext(context, text: 'Booking id:51516551'),
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Gallery'),
                onTap: () {
                  // Handle gallery option
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  // Handle camera option
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('Cancel'),
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
