// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:medway_app/view/settings_tabs/favourite_screen.dart';

WNormalAppBar(context) {
  return AppBar(
    toolbarHeight: 60,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouriteScreen(),
                ));
          },
          icon: const Icon(Icons.favorite_border))
    ],
    elevation: 0,
    title: const TextField(
      decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
    ),
    backgroundColor: Colors.transparent,
    foregroundColor: const Color.fromARGB(255, 16, 105, 140),
  );
}

titleAppBar({required title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
  );
}
