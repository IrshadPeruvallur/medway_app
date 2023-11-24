import 'package:flutter/material.dart';

captiontext(context, {required text, required}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
  );
}

titleText(context, {required text, required double? size, color}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: MediaQuery.of(context).size.width * size!,
      fontWeight: FontWeight.bold,
    ),
  );
}
