import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medway_app/bottom_tabs/account_tab.dart';
import 'package:medway_app/bottom_tabs/home_tab.dart';
import 'package:medway_app/bottom_tabs/booking_tab.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final items = [
    Icon(Icons.home),
    Icon(Icons.calendar_month),
    Icon(Icons.person),
  ];

  final List<Widget> tabs = [HomeTab(), BookingTab(), AccountTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: Color.fromARGB(255, 16, 105, 140),
        items: items,
        height: 60,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}