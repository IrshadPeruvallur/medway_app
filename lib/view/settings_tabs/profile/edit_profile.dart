// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medway_app/controller/db_providers/db_profile.dart';
import 'package:medway_app/controller/edit_profile_provider.dart';
import 'package:medway_app/model/profile_model/profile_model.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';
import 'package:provider/provider.dart';

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
    final getProvider =
        Provider.of<EditProfileProvider>(context, listen: false);
    super.initState();
    getProvider.nameController.text = widget.name;
    getProvider.phoneController.text = widget.number;
    getProvider.dobController.text = widget.dob;
    getProvider.emailController.text = widget.email;
    getProvider.picked = widget.image != null ? File(widget.image) : null;
  }

  @override
  Widget build(BuildContext context) {
    final getProvider =
        Provider.of<EditProfileProvider>(context, listen: false);
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
                                      getProvider
                                          .updateImage(ImageSource.camera);
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
                                      getProvider
                                          .updateImage(ImageSource.gallery);
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
                    child: getProvider.picked == null
                        ? const Image(
                            image: AssetImage('asset/addprofile icon.png'))
                        : ClipOval(
                            child: Image.file(
                            getProvider.picked!,
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
                    controller: getProvider.nameController,
                    label: "Name",
                    hint: "Name"),
                WTextformField(context,
                    inputformat: FilteringTextInputFormatter.digitsOnly,
                    keyboardType: TextInputType.phone,
                    prificsText: '+91',
                    maxlength: 10,
                    controller: getProvider.phoneController,
                    label: "Phone",
                    hint: "Phone"),
                WTextformField(context,
                    inputformat: FilteringTextInputFormatter.digitsOnly,
                    keyboardType: TextInputType.number,
                    label: "DOB",
                    hint: "DOB",
                    controller: getProvider.dobController),
                WTextformField(context,
                    inputformat: FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9a-zA-Z]')),
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    hint: "Email",
                    controller: getProvider.emailController),
                SizedBox(
                  height: screenSize.width * 0.05,
                ),
                WElevatedButton(
                  context,
                  text: 'Submit',
                  navigator: () async {
                    await editProfile();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editProfile() async {
    final editProvider =
        Provider.of<EditProfileProvider>(context, listen: false);
    final user = UserModel(
      index: widget.index,
      image: editProvider.picked?.path ?? widget.image,
      name: editProvider.nameController.text,
      phone: editProvider.phoneController.text,
      email: editProvider.emailController.text,
      dob: editProvider.dobController.text,
    );

    await Provider.of<DBProfile>(context, listen: false)
        .updateUser(user.index!, user);
    Navigator.pop(context);
  }
}
