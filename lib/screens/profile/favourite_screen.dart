import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medway_app/function/favourite_db_function.dart';
import 'package:medway_app/screens/appointment.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllFvrt();
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: 'Favourite'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: favouriteListNotifier,
          builder: (context, fvrtItem, child) {
            return Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: fvrtItem.length,
                  itemBuilder: (context, index) {
                    final data = fvrtItem[index];
                    return Slidable(
                        startActionPane:
                            ActionPane(motion: StretchMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              deleteFromFvrt(index);
                            },
                            icon: Icons.delete,
                          ),
                          SlidableAction(
                            icon: Icons.calendar_month,
                            label: "Make Appointment",
                            onPressed: (context) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Appointment(
                                        index: index,
                                        docterPic: data.dPhoto,
                                        docterName: data.dName,
                                        docterspeciality: data.dSpeciality))),
                          )
                        ]),
                        child: doctersCard(context,
                            picture: data.dPhoto,
                            name: data.dName,
                            speciality: data.dSpeciality));
                  }),
            );
          },
        ),
      ),
    );
  }
}
