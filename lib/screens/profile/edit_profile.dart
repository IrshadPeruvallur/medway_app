import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medway_app/function/user_db_function.dart';
import 'package:medway_app/model/profile_model.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

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
  EditProfile(
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
    // TODO: implement initState
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
                        title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              updateImage(ImageSource.camera);
                            },
                            icon: Icon(Icons.camera_alt),
                            label: Text("Camera")),
                        TextButton.icon(
                            onPressed: () {
                              updateImage(ImageSource.gallery);
                            },
                            icon: Icon(Icons.image),
                            label: Text("Gallery"))
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
                    updateProfile(widget.index);
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
    addUser(_user);
  }

  updateImage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    setState(() {
      picked = File(img!.path);
    });
  }
}
