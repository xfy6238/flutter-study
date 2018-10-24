import 'package:flutter/material.dart';
import 'pages/home.dart' show Home;
import 'pages/about.dart' show About;

void main(List<String> args) {
  runApp(new MaterialApp(
    home: Home(),
    routes: {
      "/home": (context) => Home(),
      "/about": (context) => About(),
    },
  ));
}
