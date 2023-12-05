import 'package:flutter/material.dart';
import 'package:medway_app/screens/profile/edit_profile.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});
  final List labelText = [
    'Name',
    'Phone Number',
    'Email',
    'DOB',
    'Gender',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ));
              },
              icon: Icon(Icons.edit))
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: screenSize.width * 0.15,
                  backgroundImage: AssetImage('asset/irshad.jpeg'),
                ),
                WTitleText(context, text: 'Irshad Ali', size: 0.05),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(screenSize.width * 0.04))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        doubleText(context, text1: 'Name', text2: 'Irshad'),
                        doubleText(context, text1: 'Age', text2: '21'),
                        doubleText(context,
                            text1: 'Mobile No', text2: '9048623502'),
                        doubleText(context,
                            text1: 'Email', text2: 'irshadpukayoor@gmail.com'),
                        doubleText(context, text1: 'Gender', text2: 'Male'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
