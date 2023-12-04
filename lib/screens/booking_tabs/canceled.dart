import 'package:flutter/material.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class CanceledTab extends StatelessWidget {
  const CanceledTab({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: 5,
                itemBuilder: (context, index) => Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenSize.width * .03)),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            captiontext(context,
                                text: 'November 20, 2023 - 10.00'),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'asset/modern-flat-illustration-doctor-wearing-mask-stethoscope_115122-1428.jpg')),
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          const Color.fromARGB(255, 97, 97, 97),
                                    ),
                                    height: 120,
                                    width: 100,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          Icons.star,
                                          size: screenSize.width * 0.05,
                                          color: const Color.fromARGB(
                                              255, 255, 199, 59),
                                        ),
                                      ),
                                    ),
                                    WTitleText(context,
                                        text: 'Dr.Arun', size: 0.05),
                                    captiontext(context, text: 'Mentelist'),
                                    captiontext(context,
                                        text: 'Booking id:51516551'),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
