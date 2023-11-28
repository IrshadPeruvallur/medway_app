import 'package:flutter/material.dart';

WAppBar() {
  return AppBar(
    toolbarHeight: 60,
    // automaticallyImplyLeading: false,
    leading: Image(
      image: AssetImage('asset/medcalway-white-logo.png'),
      width: 20,
      color: Color.fromARGB(255, 16, 105, 140),
    ),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.notifications))],
    elevation: 0,
    title: TextField(
      decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
    ),
    backgroundColor: Colors.transparent,
    foregroundColor: Color.fromARGB(255, 16, 105, 140),
  );
}
