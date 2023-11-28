import 'package:flutter/material.dart';
import 'package:medway_app/screens/main_screen.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: screenSize.width * .2),
              WTitleText(context, text: 'Login', size: .08),
              SizedBox(height: screenSize.width * .2),
              WTextformFeild(context,
                  hint: 'example@gmail.com', label: 'Email'),
              SizedBox(height: screenSize.width * .03),
              WTextformFeild(context, hint: 'A92@39', label: 'Password'),
              SizedBox(height: screenSize.width * .1),
              WElevatedButton(
                context,
                text: 'Login',
                navigator: () =>
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MainScreen(),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
