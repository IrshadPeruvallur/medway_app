import 'package:flutter/material.dart';
import 'package:medway_app/screens/booking_tabs/canceled.dart';
import 'package:medway_app/screens/booking_tabs/completed.dart';
import 'package:medway_app/screens/booking_tabs/upcoming.dart';
import 'package:medway_app/screens/search/search.dart';

class BookingTab extends StatefulWidget {
  const BookingTab({super.key});

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                Tab(
                  text: "Completed",
                ),
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
                        builder: (context) => Search(),
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
              children: [UpComingTab(), CompletedTab(), CanceledTab()]),
        ),
      ),
    );
  }
}
