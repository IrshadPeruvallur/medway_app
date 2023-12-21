import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medway_app/controller/functions/normal_controller.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenSize.width * .2),
                  WTitleText(context, text: 'Login', size: .08),
                  SizedBox(height: screenSize.width * .2),
                  WTextformField(
                    inputformat: FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9a-zA-Z]')),
                    context,
                    keyboardType: TextInputType.emailAddress,
                    hint: 'example@gmail.com',
                    label: 'Email',
                    controller: _emailController,
                  ),
                  SizedBox(height: screenSize.width * .008),
                  WTextformField(
                    inputformat: FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9a-zA-Z]')),
                    keyboardType: TextInputType.visiblePassword,
                    context,
                    hint: 'A92@39',
                    label: 'Password',
                    controller: _passwordController,
                  ),
                  SizedBox(height: screenSize.width * .1),
                  WElevatedButton(
                    context,
                    text: 'Login',
                    navigator: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (context) => MainScreen()));
                        checklogin(
                            context, _emailController, _passwordController);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
