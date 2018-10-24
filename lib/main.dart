// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
