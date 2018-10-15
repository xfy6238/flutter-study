// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'dto/test.dart';

class TabbedAppBarSample extends StatelessWidget {

  final String title = 'app';

  Future<void> getData() async {
    http.Response response = await http.get('http://10.10.1.26:9100/getData');
    Test test = new Test.fromJson(jsonDecode(response.body));
    print(test.records[0].id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Tabbed AppBar'),
              bottom: TabBar(
                isScrollable: false,
                indicator: new ShapeDecoration(
                    shape: new Border.all(color: Colors.redAccent, width: 1.0)),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: choices.map((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList(),
              ),
            ),
            body: Center(
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: getData,
              ),
            )),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'CAR', icon: Icons.directions_car),
  Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  Choice(title: 'BOAT', icon: Icons.directions_boat),
  Choice(title: 'BUS', icon: Icons.directions_bus),
  Choice(title: 'TRAIN', icon: Icons.directions_railway),
  Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(TabbedAppBarSample());
}

/*
Sample Catalog

Title: Tabbed AppBar

Summary: An AppBar with a TabBar for navigating pages just below it.

Description:
A TabBar can be used to navigate among the pages displayed in a TabBarView.
Although a TabBar is an ordinary widget that can appear anywhere, it's most often
included in the application's AppBar.

Classes: AppBar, DefaultTabController, TabBar, Scaffold, TabBarView

Sample: TabbedAppBarSample

See also:
  - The "Components-Tabs" section of the material design specification:
    <https://material.io/go/design-tabs>
*/
