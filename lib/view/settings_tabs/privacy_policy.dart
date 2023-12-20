import 'package:flutter/material.dart';
import 'package:medway_app/screens/widgets/main_widgets.dart';
import 'package:medway_app/screens/widgets/small_widgets.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar(title: 'Favourite'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            WTitleText(context, text: 'Cancalation Policy', size: 0.05),
            Text(
                textAlign: TextAlign.start,
                'We understand that circumstances may arise, and you may need to cancel or reschedule your doctor appointment. We value your time and appreciate your cooperation with our cancellation policy.'),
            WTitleText(context, text: 'Terms & Condition', size: 0.05),
            Text(
                textAlign: TextAlign.start,
                '''By accessing or using the Medway app, you agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, you may not use our services.\n\n Medway provides a platform for scheduling and managing doctor appointments. We do not provide medical services but facilitate the connection between patients and healthcare providers.\n\n Users are required to create an account to access certain features of the app. You are responsible for maintaining the confidentiality of your account information.\n\nOur Privacy Policy outlines how we collect, use, and protect your personal information. By using the Medway app, you consent to the practices described in the Privacy Policy.\n\nAll content and materials available on the Medway app, including but not limited to text, graphics, logos, and images, are the property of Medway and are protected by applicable intellectual property laws.''')
          ]),
        ),
      ),
    );
  }
}
