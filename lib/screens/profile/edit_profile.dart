import 'package:flutter/material.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final List labelText = [
    'Name',
    'Phone Number',
    'Email',
    'DOB',
    'Gender',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: "Your Profile"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: screenSize.width * 0.15,
                  backgroundImage: AssetImage('asset/irshad.jpeg'),
                ),
                WTitleText(context, text: 'Irshad Ali', size: 0.05),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: labelText.length,
                    itemBuilder: (context, index) => WTextformField(context,
                        label: labelText[index], hint: labelText[index])),
                SizedBox(
                  height: screenSize.width * 0.05,
                ),
                WElevatedButton(
                  context,
                  text: 'Submit',
                  navigator: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
