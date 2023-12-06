import 'package:flutter/material.dart';
import 'package:medway_app/main.dart';
import 'package:medway_app/screens/login_screen.dart';
import 'package:medway_app/screens/main_screen.dart';
import 'package:medway_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// bottomSheet(context) {
//   return showBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         // Customize the appearance of the bottom sheet
//         height: 200,
//         child: Center(
//           child: Text(
//             'This is a Bottom Sheet!',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//       );
//     },
//   );
// }

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
