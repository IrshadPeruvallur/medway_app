import 'package:flutter/material.dart';
import 'package:medway_app/controller/db_providers/db_cancel.dart';
import 'package:medway_app/controller/db_providers/db_favourite.dart';
import 'package:medway_app/services/cancel_service.dart';
import 'package:medway_app/services/favourite_service.dart';
import 'package:medway_app/main.dart';
import 'package:medway_app/model/cancel_model/canceled_model.dart';
import 'package:medway_app/model/favourite_model/fvrt_model.dart';
import 'package:medway_app/view/welcome_pages/login_screen.dart';
import 'package:medway_app/view/welcome_pages/main_screen.dart';
import 'package:medway_app/view/welcome_pages/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

checklogin(context, controller1, controller2) async {
  final _email = controller1.text;
  final _password = controller2.text;
  if (_email == _password) {
    print('match');
    final _shardPrefrs = await SharedPreferences.getInstance();
    await _shardPrefrs.setBool(save_key_name, true);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
        (route) => false);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Username password does not match'),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      duration: Duration(seconds: 3),
    ));

    print("Username password doesnot match");
  }
}

Future gotoLogin(context) async {
  await Future.delayed(Duration(seconds: 3));
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => WelcomeScreen()));
}

checkedUserLoggedIn(context) async {
  final _sharedPrfs = await SharedPreferences.getInstance();
  final userloggedin = _sharedPrfs.getBool(save_key_name);
  if (userloggedin == null || userloggedin == false) {
    gotoLogin(context);
  } else {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
        (route) => false);
  }
}

fsignout(BuildContext context) async {
  final _shardPrfs = await SharedPreferences.getInstance();
  await _shardPrfs.clear();
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
