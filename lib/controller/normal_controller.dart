// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:medway_app/controller/db_providers/db_favourite.dart';
import 'package:medway_app/main.dart';
import 'package:medway_app/model/favourite_model/fvrt_model.dart';
import 'package:medway_app/view/welcome_pages/login_screen.dart';
import 'package:medway_app/view/welcome_pages/main_screen.dart';
import 'package:medway_app/view/welcome_pages/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

checklogin(context, controller1, controller2) async {
  final email = controller1.text;
  final password = controller2.text;
  if (email == password) {
    final shardPrefrs = await SharedPreferences.getInstance();
    await shardPrefrs.setBool(save_key_name, true);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Username password does not match'),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      duration: Duration(seconds: 3),
    ));
  }
}

Future gotoLogin(context) async {
  await Future.delayed(const Duration(seconds: 3));
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const WelcomeScreen()));
}

checkedUserLoggedIn(context) async {
  final sharedPrfs = await SharedPreferences.getInstance();
  final userloggedin = sharedPrfs.getBool(save_key_name);
  if (userloggedin == null || userloggedin == false) {
    gotoLogin(context);
  } else {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false);
  }
}

fsignout(BuildContext context) async {
  final shardPrfs = await SharedPreferences.getInstance();
  await shardPrfs.clear();
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
      (route) => false);
}

onAddToFvrt(name, imagepath, speciality, context) async {
  final favourite =
      FavouriteModel(dName: name, dSpeciality: speciality, dPhoto: imagepath);
  Provider.of<DBFavourite>(context, listen: false).addToFvrt(favourite);
}
