// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medway_app/services/patient.dart';
import 'package:medway_app/controller/main_screen_provider.dart';
import 'package:medway_app/view/main_tabs/booking_tab.dart';
import 'package:medway_app/view/main_tabs/home_tab.dart';
import 'package:medway_app/view/main_tabs/profile_tab.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<MainScreenProvider>(
      context,
    );
    getAllAppoitnment();
    return Scaffold(
      body: getProvider.tabs[getProvider.currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: getProvider.currentIndex,
        backgroundColor: const Color.fromARGB(255, 16, 105, 140),
        items: getProvider.items,
        height: 60,
        onTap: (int index) {
          getProvider.bottomFunction(index);
        },
      ),
    );
  }
}
