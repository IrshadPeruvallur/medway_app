// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_null_comparison

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

final nameController = TextEditingController();
final phoneController = TextEditingController();
final emailController = TextEditingController();
final dobController = TextEditingController();
final imagePicker = ImagePicker();
File? picked;

class EditProfile extends StatefulWidget {
  final String name;
  final String dob;
  final String number;
  final String email;
  final String image;
  final int index;
  const EditProfile(
      {super.key,
      required this.name,
      required this.dob,
      required this.number,
      required this.email,
      required this.image,
      required this.index});

  @override
  State<EditProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    phoneController.text = widget.number;
    dobController.text = widget.dob;
    emailController.text = widget.email;
    picked = widget.image != null ? File(widget.image) : null;
  }

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
                                Radius.circular(screenSize.width * 0.05))),
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
                                            const MaterialStatePropertyAll(
                                                Colors.white),
                                        elevation:
                                            const MaterialStatePropertyAll(02)),
                                    onPressed: () {
                                      updateImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.camera_alt),
                                    label: const Text("Camera")),
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
                                            const MaterialStatePropertyAll(
                                                Colors.white),
                                        elevation:
                                            const MaterialStatePropertyAll(02)),
                                    onPressed: () {
                                      updateImage(ImageSource.gallery);
                                    },
                                    icon: const Icon(Icons.image),
                                    label: const Text("Gallery"))
                              ],
                            ),
                          ],
                        )),
                  ),
                  child: CircleAvatar(
                    radius: screenSize.width * 0.15,
                    backgroundColor: Colors.white,
                    child: picked == null
                        ? const Image(
                            image: AssetImage('asset/addprofile icon.png'))
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
                    inputformat: FilteringTextInputFormatter.digitsOnly,
                    keyboardType: TextInputType.number,
                    label: "DOB",
                    hint: "DOB",
                    controller: dobController),
                WTextformField(context,
                    inputformat: FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9a-zA-Z]')),
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
                    // Provider.of<DBProfile>(context, listen: false).updateUser(widget.index);
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

  updateImage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    setState(() {
      picked = File(img!.path);
    });
  }
}
