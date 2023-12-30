import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:medway_app/controller/db_providers/db_favourite.dart';
import 'package:medway_app/services/favourite_service.dart';
import 'package:medway_app/view/appointments_pages/appointment.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<DBFavourite>(context);
    getProvider.getAllFavourite();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: titleAppBar(title: 'Favourite'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: getProvider.favouritedList.isEmpty
            ? Center(
                child: Lottie.asset('asset/empty.json'),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: getProvider.favouritedList.length,
                        itemBuilder: (context, index) {
                          final data = getProvider.favouritedList[index];
                          return Slidable(
                              startActionPane: ActionPane(
                                  motion: StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      backgroundColor:
                                          Color.fromARGB(255, 121, 0, 0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      onPressed: (context) {
                                        getProvider.deleterFromFvrt(index);
                                      },
                                      icon: Icons.delete,
                                    ),
                                    // SizedBox(
                                    //   width: screenSize.width * .02,
                                    // ),
                                    SlidableAction(
                                      backgroundColor:
                                          Color.fromARGB(255, 16, 105, 140),
                                      borderRadius: BorderRadius.circular(
                                          screenSize.width * .05),
                                      icon: Icons.calendar_month,
                                      // label: "Make Appointment",
                                      onPressed: (context) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Appointment(
                                                  index: index,
                                                  docterPic: data.dPhoto,
                                                  docterName: data.dName,
                                                  docterspeciality:
                                                      data.dSpeciality))),
                                    )
                                  ]),
                              child: doctersCard(context,
                                  picture: data.dPhoto,
                                  name: data.dName,
                                  speciality: data.dSpeciality));
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
