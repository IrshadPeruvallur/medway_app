import 'package:flutter/material.dart';

WAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.notifications))],
    elevation: 0,
    title: TextField(
      decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
    ),
    backgroundColor: Colors.transparent,
    foregroundColor: Color.fromARGB(255, 16, 105, 140),
  );
}
