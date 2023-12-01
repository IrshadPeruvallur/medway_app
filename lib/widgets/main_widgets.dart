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
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))],
    elevation: 0,
    title: TextField(
      decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
    ),
    backgroundColor: Colors.transparent,
    foregroundColor: Color.fromARGB(255, 16, 105, 140),
  );
}

WNormalAppBar() {
  return AppBar(
    toolbarHeight: 60,
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.notifications))],
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
