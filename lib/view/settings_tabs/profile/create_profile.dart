// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medway_app/controller/db_providers/db_profile.dart';
import 'package:medway_app/services/profile_service.dart';
import 'package:medway_app/model/profile_model/profile_model.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';
import 'package:provider/provider.dart';

class CreateProfile extends StatefulWidget {
  CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final dobController = TextEditingController();

  final imagePicker = ImagePicker();

  File? picked;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: "Edit Profile"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(screenSize.width * .05))),
                        title: Column(
                          children: [
                            WTitleText(context, text: "Choose from", size: .05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton.icon(
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        screenSize.width *
                                                            0.02))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white),
                                        elevation:
                                            MaterialStatePropertyAll(02)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      getImage(ImageSource.camera);
                                    },
                                    icon: Icon(Icons.camera_alt),
                                    label: Text("Camera")),
                                SizedBox(
                                  width: screenSize.width * 0.05,
                                ),
                                TextButton.icon(
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        screenSize.width *
                                                            0.02))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white),
                                        elevation:
                                            MaterialStatePropertyAll(02)),
                                    onPressed: () {
                                      getImage(ImageSource.gallery);
                                    },
                                    icon: Icon(Icons.image),
                                    label: Text("Gallery"))
                              ],
                            ),
                          ],
                        )),
                  ),
                  child: CircleAvatar(
                    radius: screenSize.width * 0.15,
                    backgroundColor: Colors.white,
                    child: picked == null
                        ? Image(image: AssetImage('asset/addprofile icon.png'))
                        : ClipOval(
                            child: Image.file(
                            picked!,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          )),
                  ),
                ),
                WTextformField(context,
                    keyboardType: TextInputType.name,
                    inputformat:
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    controller: nameController,
                    label: "Name",
                    hint: "Name"),
                WTextformField(context,
                    inputformat: FilteringTextInputFormatter.digitsOnly,
                    keyboardType: TextInputType.phone,
                    prificsText: '+91',
                    maxlength: 10,
                    controller: phoneController,
                    label: "Phone",
                    hint: "Phone"),
                WTextformField(context,
                    inputformat:
                        FilteringTextInputFormatter.singleLineFormatter,
                    keyboardType: TextInputType.number,
                    label: "DOB",
                    hint: "DOB",
                    controller: dobController),
                WTextformField(context,
                    inputformat: FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z0-9@._-]')),
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    hint: "Email",
                    controller: emailController),
                SizedBox(
                  height: screenSize.width * 0.05,
                ),
                WElevatedButton(
                  context,
                  text: 'Submit',
                  navigator: () {
                    onAddUserButtonClicked();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onAddUserButtonClicked() async {
    final _name = nameController.text.trim();
    final _phone = phoneController.text.trim();
    final _email = emailController.text.trim();
    final _dob = dobController.text.trim();

    // if (_name.isEmpty || _phone.isEmpty || _email.isEmpty || _dob.isEmpty) {
    //   return;
    // }
    final _user = UserModel(
        name: _name,
        phone: _phone,
        email: _email,
        dob: _dob,
        image: picked?.path ?? '');
    Provider.of<DBProfile>(context, listen: false).addUser(_user);
  }

  getImage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    setState(() {
      picked = File(img!.path);
    });
  }
}
