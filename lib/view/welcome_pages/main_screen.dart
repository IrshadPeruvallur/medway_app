// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medway_app/controller/db_providers/db_appointment.dart';
import 'package:medway_app/controller/main_screen_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MainScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<MainScreenProvider>(
      context,
    );
    Provider.of<DBAppointment>(context).getAllAppointment();
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
