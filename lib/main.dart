import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'pages/home.dart' show Home;
import 'pages/about.dart' show About;
import 'example/main.dart' show Shop;
import 'example/productList.dart' show ProductCard;

void main(List<String> args) {
//  debugPaintSizeEnabled = true;
  runApp(new MaterialApp(
    home: Home(),
    routes: {
      "/home": (context) => Home(),
      "/about": (context) => About(),
      "/shop": (context) => Shop(),
      "/product": (context) => ProductCard(),
    },
  ));
}
