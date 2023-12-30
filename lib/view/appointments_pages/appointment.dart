// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medway_app/controller/appointment_provider.dart';
import 'package:medway_app/view/settings_tabs/favourite_screen.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';

import 'package:provider/provider.dart';

class Appointment extends StatelessWidget {
  final String docterPic;
  final String docterName;
  final String docterspeciality;
  final int index;

  const Appointment(
      {super.key,
      required this.index,
      required this.docterPic,
      required this.docterName,
      required this.docterspeciality});

  @override
  Widget build(BuildContext context) {
    final getProvider =
        Provider.of<AppointmentProvider>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 60,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavouriteScreen(),
                    ));
              },
              icon: Icon(Icons.favorite_border))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 16, 105, 140),
      ),
      body: SafeArea(
        child: Form(
          key: getProvider.formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      // height: screenSize.width * .054,
                      ),
                  doctersCard(context,
                      picture: docterPic,
                      name: docterName,
                      speciality: docterspeciality),
                  SizedBox(
                    height: screenSize.width * 0.05,
                  ),
                  WTextformField(
                    inputformat:
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    keyboardType: TextInputType.name,
                    controller: getProvider.nameController,
                    context,
                    label: 'Name',
                  ),
                  WTextformField(
                      maxlength: 10,
                      inputformat: FilteringTextInputFormatter.digitsOnly,
                      keyboardType: TextInputType.number,
                      controller: getProvider.phoneController,
                      context,
                      label: 'Phone',
                      prificsText: '+91'),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  // captiontext(context, text: 'Gender'),
                  Consumer<AppointmentProvider>(
                      builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == "Select One") {
                          return "Plese Choose one";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 16, 105, 140)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      borderRadius:
                          BorderRadius.circular(screenSize.width * 0.02),
                      isExpanded: true,
                      value: value.dropdownvalue,
                      onChanged: (String? newvalue) {
                        value.changeGender(newvalue);
                      },
                      items: const [
                        DropdownMenuItem(
                            value: "Select One", child: Text('Select One')),
                        DropdownMenuItem(value: "Male", child: Text('Male')),
                        DropdownMenuItem(
                            value: "Female", child: Text('Female')),
                        DropdownMenuItem(value: "Other", child: Text('Other')),
                      ],
                    );
                  }),
                  WTextformField(
                    maxlength: 2,
                    inputformat: FilteringTextInputFormatter.digitsOnly,
                    keyboardType: TextInputType.number,
                    controller: getProvider.ageController,
                    context,
                    label: 'Age',
                  ),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  WTextformField(
                    inputformat:
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    controller: getProvider.problemController,
                    keyboardType: TextInputType.text,
                    context,
                    label: 'Problem',
                  ),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  // captiontext(context, text: 'Time'),
                  Consumer<AppointmentProvider>(
                      builder: (context, value, child) {
                    return TextFormField(
                      onTap: () => value.selectTime(context),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select Time";
                        } else {
                          return null;
                        }
                      },
                      controller: value.timeController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'Time',
                        suffixIcon: IconButton(
                          onPressed: () {
                            value.selectTime(context);
                          },
                          icon: const Icon(Icons.calendar_today),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 16, 105, 140)),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  // captiontext(context, text: 'Date'),
                  Consumer<AppointmentProvider>(
                      builder: (context, value, child) {
                    return TextFormField(
                      onTap: () => value.selectDate(context),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select Date";
                        } else {
                          return null;
                        }
                      },
                      controller: value.dateController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        suffixIcon: IconButton(
                          onPressed: () {
                            value.selectDate(context);
                          },
                          icon: const Icon(Icons.calendar_today),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 16, 105, 140)),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: screenSize.width * 0.04,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        WElevatedButton(context, text: 'Submit', navigator: () {
                      if (getProvider.formKey.currentState!.validate()) {
                        getProvider.onAddPatientButtonClicked(context,
                            docterspeciality, docterName, docterPic, index);
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
