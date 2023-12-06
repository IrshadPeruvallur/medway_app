import 'package:flutter/material.dart';
import 'package:medway_app/function/nrml_function.dart';
import 'package:medway_app/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // gotoLogin(context);
    // TODO: implement initState
    checkedUserLoggedIn(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 105, 140),
      body: Center(
          child: Image(
        image: AssetImage('asset/medcalway-white-logo.png'),
        width: screenSize.width * 0.3,
      )),
    );
  }
}
