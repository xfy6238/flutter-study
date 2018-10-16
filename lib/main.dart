// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'dto/test.dart';

Future<Test> getData(context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            width: 180.0,
            height: 180.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      });
  http.Response response = await http.get('http://10.10.1.26:9100/getData');
  Test test = new Test.fromJson(jsonDecode(response.body));
  Navigator.pop(context);
  return test;
}

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
                      getData(context).then((Test test) {
                        print(test.records[0].id);
                        setState(() {
                          title = test.records[0].id;
                        });
                      });
                    },
                  ),
                ),
              );
            },
          )),
    );
  }
}
