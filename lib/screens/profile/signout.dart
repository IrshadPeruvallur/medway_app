import 'package:flutter/material.dart';
import 'package:medway_app/function/functio_normal.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class Synout extends StatelessWidget {
  const Synout({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: 'Signout'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  WTitleText(context, text: 'Sign out', size: 0.05),
                  Text(
                      textAlign: TextAlign.start,
                      'Before you proceed with signing out, please be aware that doing so will log you out of your Medway account. Any unsaved data or incomplete transactions may be lost. Ensure that you have saved any important information before proceeding. Additionally, signing out will temporarily suspend access to your personalized medical information and appointment history. You will need to sign in again to view and manage your healthcare-related data. If you are sure about signing out, click the "Sign Out" button below. If you have any concerns or if this action was unintentional, you may click "Cancel" to return to your Medway session. Remember to keep your login credentials secure to protect your account and sensitive information.'),
                ],
              ),
              WElevatedButton(context, navigator: () {
                fsignout(context);
              }, text: 'Signout')
            ]),
      ),
    );
  }
}
