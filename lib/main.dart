import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'pages/home.dart' show Home;
import 'pages/about.dart' show About;

void main(List<String> args) {
  debugPaintSizeEnabled = false;
  runApp(new MaterialApp(
    home: Home(),
    routes: {
      "/home": (context) => Home(),
      "/about": (context) => About(),
    },
  ));
}
