import 'package:flutter/material.dart';
import 'package:medway_app/view/booking_tabs/canceled.dart';
import 'package:medway_app/view/booking_tabs/upcoming.dart';
import 'package:medway_app/view/search/search_paitent.dart';

class BookingTab extends StatelessWidget {
  const BookingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () => Navigator.pop(context),
          //     icon: Icon(Icons.arrow_back_ios)),
          bottom: TabBar(
              labelColor: Color.fromARGB(255, 16, 105, 140),
              indicatorColor: Color.fromARGB(255, 16, 105, 140),
              tabs: [
                Tab(
                  text: "Upcoming",
                ),
                /* Tab(
                  text: "Completed",
                ), */
                Tab(
                  text: "Cancled",
                )
              ]),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Color.fromARGB(255, 16, 105, 140),
          title: Text('My Booking'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPatient(),
                      ));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/background.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: TabBarView(
              children: [UpComingTab(), /*  CompletedTab(), */ CanceledTab()]),
        ),
      ),
    );
  }
}