import 'package:flutter/material.dart';
import 'package:medway_app/function/nrml_function.dart';
import 'package:medway_app/screens/profile/Account.dart';
import 'package:medway_app/screens/profile/favourite_screen.dart';
import 'package:medway_app/screens/profile/help_center.dart';
import 'package:medway_app/screens/profile/my_profile.dart';
import 'package:medway_app/screens/profile/privacy_policy.dart';
import 'package:medway_app/screens/profile/settings.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});
  final List profileList = [
    'Your Profile',
    'Favourite',
    'Settings',
    'Help Center',
    'Privicy Policy',
    'Delete Account',
  ];
  final List profileIcons = [
    Icon(Icons.person_2_outlined),
    Icon(Icons.favorite_border),
    Icon(Icons.settings),
    Icon(Icons.help),
    Icon(Icons.lock_outline),
    Icon(Icons.delete_rounded),
  ];

  final List profileTabs = [
    MyProfile(),
    FavouriteScreen(),
    Settings(),
    HelpCenter(),
    PrivacyPolicy(),
    DeleteAccount()
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
                          child: Text("Cancel")),
                      TextButton(
                          onPressed: () {
                            fsignout(context);
                          },
                          child: Text("Log out")),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.logout_outlined))
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: screenSize.width * 0.15,
                backgroundImage: AssetImage('asset/irshad.jpeg'),
              ),
              WTitleText(context, text: 'Irshad Ali', size: 0.05),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
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
