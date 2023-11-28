import 'package:flutter/material.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            doctersCard(context),
            Divider(
              color: Colors.black,
            ),
            Text('data'),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        captiontext(context, text: 'Name'),
                        captiontext(context, text: 'Irshad')
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 3,
                      ),
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}
