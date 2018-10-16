// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'services/exampl.dart' show postData hide getData;

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  AppState createState() => new AppState();
}

class AppState extends State<App> {
  String title = "title";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: this.title,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text(this.title),
          ),
          body: new Builder(
            builder: (BuildContext context) {
              return Center(
                child: Container(
                  child: IconButton(
                    icon: Icon(Icons.open_in_browser),
                    onPressed: () {
                      // getData(context).then((Test test) {
                      //   setState(() {
                      //     title = test.records[0].id;
                      //   });
                      // });
                      postData(context);
                    },
                  ),
                ),
              );
            },
          )),
    );
  }
}
