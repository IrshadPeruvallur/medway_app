// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:medway_app/controller/db_providers/db_profile.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';
import 'package:provider/provider.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: 'Delete Account'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          WTitleText(context, text: 'Deleting Your Medway Account', size: 0.05),
          Text(
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * .038),
              textAlign: TextAlign.start,
              '''Are you sure you want to proceed with deleting your Medway account? This action is irreversible and will result in the permanent loss of all your data, including medical records, appointment history, and personalized settings. Once your account is deleted, you won't be able to recover any information.
Please consider the following before confirming your decision:
Data Loss: All your health-related data will be permanently deleted.
Account History: Your account history and activity will be erased.
App Access: You will no longer have access to Medway services.
If you are certain about deleting your account, please enter your password to confirm. If not, you can cancel this action to retain your account and data.

We value your privacy and are here to assist you. If you have any concerns or require support, please contact our customer service at [support@medway.com].'''),
          const SizedBox(
            height: 25,
          ),
          WElevatedButton(context, navigator: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(screenSize.width * 0.05))),
                title: Column(
                  children: [
                    WTitleText(context,
                        text: 'Warning', size: 0.05, color: Colors.red),
                    captiontext(context,
                        text:
                            '''Once you delete your account, there's no getting it back. Make sure you want to do this.''')
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        Provider.of<DBProfile>(context, listen: false)
                            .deleteAccount(context);
                      },
                      child: const Text("Yes, Delete")),
                ],
              ),
            );
          }, text: 'Delete Account')
        ]),
      ),
    );
  }
}
