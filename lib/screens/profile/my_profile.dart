import 'package:flutter/material.dart';
import 'package:medway_app/function/user_db_function.dart';
import 'package:medway_app/screens/profile/create_profile.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateProfile(),
                    ));
              },
              icon: Icon(Icons.edit))
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder(
            valueListenable:
                userListNotifier, // Make sure userListNotifier is defined
            builder: (context, userList, child) {
              return userList.isEmpty
                  ? Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('asset/profile icons.png'),
                            radius: 50,
                          ),
                        ),
                        WTitleText(context, text: 'MEDWAy02145', size: 0.05),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  MediaQuery.of(context).size.width * 0.03))),
                          child: ListTile(
                            onTap: () =>
                                Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return CreateProfile();
                              },
                            )),
                            title: Text("Complete your Profile"),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: screenSize.width * 0.05,
                            ),
                          ),
                        )
                      ],
                    )
                  : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final data = userList[index];
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: screenSize.width * 0.15,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(data.image.isEmpty
                                  ? 'asset/profile icons.png'
                                  : data.image),
                            ),
                            WTitleText(context, text: data.name, size: 0.05),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          screenSize.width * 0.04))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    doubleText(context,
                                        text1: 'Name', text2: data.name),
                                    doubleText(context,
                                        text1: 'Age', text2: data.dob),
                                    doubleText(context,
                                        text1: 'Mobile No', text2: data.phone),
                                    doubleText(context,
                                        text1: 'Email', text2: data.email),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
