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
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ));
  } else {
    final _errorMessage = "Username password does not match";
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 39, 39, 39),
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 5),
        content: Text(_errorMessage)));

    // showDialog(context: context, builder:(context1){
    //   return AlertDialog(
    //     title: Text("Error"),
    //     content: Text(_errorMessage),
    //     actions: [TextButton(onPressed: (){
    //       Navigator.of(context1).pop();
    //     }, child:Text("Close"))],

    //   );
    // } );
    print("Username password doesnot match");
  }
}
