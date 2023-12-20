import 'package:flutter/material.dart';
import 'package:medway_app/screens/settings_tabs/favourite_screen.dart';

WNormalAppBar(context) {
  return AppBar(
    toolbarHeight: 60,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouriteScreen(),
                ));
          },
          icon: Icon(Icons.favorite_border))
    ],
    elevation: 0,
    title: TextField(
      decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
    ),
    backgroundColor: Colors.transparent,
    foregroundColor: Color.fromARGB(255, 16, 105, 140),
  );
}

titleAppBar({required title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Color.fromARGB(255, 0, 0, 0),
  );
}
