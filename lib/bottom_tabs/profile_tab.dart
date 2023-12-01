import 'package:flutter/material.dart';
import 'package:medway_app/screens/profile/favourite_screen.dart';
import 'package:medway_app/screens/profile/settings.dart';
import 'package:medway_app/screens/profile/your_profile.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});
  final List profileList = [
    'Your Profile',
    'Favourite',
    'Settings',
    'Help Center',
    'Privicy Policy',
    'Log out'
  ];
  final List profileIcons = [
    Icon(Icons.person_2_outlined),
    Icon(Icons.favorite_border),
    Icon(Icons.settings),
    Icon(Icons.help),
    Icon(Icons.lock_outline),
    Icon(Icons.logout_outlined),
  ];

  final List profileTabs = [
    YourProfile(),
    FavouriteScreen(),
    Settings(),
    YourProfile(),
    YourProfile(),
    YourProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: "Profile"),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
