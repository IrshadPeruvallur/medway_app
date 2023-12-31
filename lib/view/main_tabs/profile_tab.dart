import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medway_app/controller/normal_controller.dart';
import 'package:medway_app/view/settings_tabs/Account.dart';
import 'package:medway_app/view/settings_tabs/favourite_screen.dart';
import 'package:medway_app/view/settings_tabs/help_center.dart';
import 'package:medway_app/view/settings_tabs/privacy_policy.dart';
import 'package:medway_app/view/settings_tabs/profile/my_profile.dart';
import 'package:medway_app/view/settings_tabs/settings.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab({super.key});
  final List profileList = [
    'Your Profile',
    'Favourite',
    'Settings',
    'Help Center',
    'Privicy Policy',
    'Delete Account',
  ];
  final List profileIcons = [
    const Icon(Icons.person_2_outlined),
    const Icon(Icons.favorite_border),
    const Icon(Icons.settings),
    const Icon(Icons.help),
    const Icon(Icons.lock_outline),
    const Icon(Icons.delete_rounded),
  ];

  final List profileTabs = [
    MyProfile(),
    const FavouriteScreen(),
    Settings(),
    HelpCenter(),
    const PrivacyPolicy(),
    const DeleteAccount()
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenSize.width * 0.05))),
                    title: Column(
                      children: [
                        WTitleText(context, text: 'Log out', size: 0.05),
                        captiontext(context,
                            text: 'You will be returned to the login screen.')
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
                            fsignout(context);
                          },
                          child: const Text("Log out")),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout_outlined))
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  height: screenSize.width * 0.4,
                  child: Lottie.asset(
                    'asset/profile lottiee.json',
                  )),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: profileList.length,
                  itemBuilder: (context, index) => Card(
                      child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => profileTabs[index],
                          ));
                    },
                    leading: profileIcons[index],
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: WTitleText(context,
                          text: profileList[index], size: 0.04),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: screenSize.width * 0.05,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
