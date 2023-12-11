import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medway_app/function/user_db_function.dart';
import 'package:medway_app/model/profile_model.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

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
                  onTap: () => getImage(ImageSource.camera),
                  child: CircleAvatar(
                    radius: screenSize.width * 0.15,
                    backgroundColor: Colors.white,
                    child: picked == null
                        ? Image(image: AssetImage('asset/addprofile icon.png'))
                        : ClipOval(
                            child: Image.file(
                            picked!,
                            fit: BoxFit.cover,
                          )),
                  ),
                ),
                WTextformField(context,
                    controller: nameController, label: "Name", hint: "Name"),
                WTextformField(context,
                    controller: phoneController, label: "Phone", hint: "Phone"),
                WTextformField(context,
                    label: "DOB", hint: "DOB", controller: dobController),
                WTextformField(context,
                    label: "Email", hint: "Email", controller: emailController),
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
    final _user = ProfileModel(
        name: _name,
        phone: _phone,
        email: _email,
        dob: _dob,
        image: picked?.path ?? '');
    addUser(_user);
  }

  getImage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    setState(() {
      picked = File(img!.path);
    });
  }
}
