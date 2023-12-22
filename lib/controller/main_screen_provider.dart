import 'package:flutter/material.dart';
import 'package:medway_app/view/main_tabs/booking_tab.dart';
import 'package:medway_app/view/main_tabs/home_tab.dart';
import 'package:medway_app/view/main_tabs/profile_tab.dart';

class MainScreenProvider extends ChangeNotifier {
  int currentIndex = 0;
  void bottomFunction(int index) {
    currentIndex = index;
    notifyListeners();
  }

  final items = [
    const Icon(Icons.home),
    const Icon(Icons.calendar_month),
    const Icon(Icons.person),
  ];

  final List<Widget> tabs = [HomeTab(), const BookingTab(), SettingsTab()];
}
