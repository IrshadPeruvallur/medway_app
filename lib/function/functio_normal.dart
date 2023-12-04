import 'package:flutter/material.dart';
import 'package:medway_app/screens/main_screen.dart';

bottomSheet(context) {
  return showBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        // Customize the appearance of the bottom sheet
        height: 200,
        child: Center(
          child: Text(
            'This is a Bottom Sheet!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    },
  );
}

checklogin(context, controller1, controller2) {
  final _email = controller1.text;
  final _password = controller2.text;
  if (_email == 'irshadpukayoor@gmail.com' && _password == '123') {
    print('match');
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

// WShowAlerDilogue() {
//   BuildContext? context;
//   return showDialog(
//     context: context!,
//     builder: (context) {
//       return AlertDialog(
//         title: Text("data"),
//         actions: [Icon(Icons.close)],
//       );
//     },
//   );
// }
