// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math';

import './rx.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    title: "app",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Model model = new Model();
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          model.close();
        },),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: model.title,
          initialData: "a",
          builder: (context, snapshot) {
            if (snapshot.data.isNotEmpty) {
              return Text("我的得分: ${snapshot.data}");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          model.setTitle(Random().nextInt(100).toString());
        },
      ),
    );
  }
}

// import 'components/Filter.dart';
// import 'package:flutter/rendering.dart';

// void main() {
//   debugPaintSizeEnabled = false;
//   runApp(App());
// }

// class App extends StatefulWidget {
//   @override
//   AppState createState() => new AppState();
// }

// class AppState extends State<App> {
//   String title = "title";

//   ScrollController controller = new ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(() {
//       if (controller.offset == controller.position.maxScrollExtent) {
//         print("出发上拉加载");
//       }
//       if (controller.offset == controller.position.minScrollExtent) {
//         print("出发下拉加载");
//       }
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: this.title,
//       theme: ThemeData(primaryColor: Colors.blue),
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text(this.title),
//           ),
//           floatingActionButton: FloatingActionButton(
//             child: Icon(Icons.thumb_up),
//             onPressed: () {
//               controller.animateTo(0.0,
//                   duration: Duration(milliseconds: 300), curve: Curves.easeIn);
//             },
//           ),
//           body: Stack(
//             children: <Widget>[
//               Builder(
//                 builder: (BuildContext context) {
//                   return ListView.builder(
//                     itemCount: 20,
//                     itemBuilder: (BuildContext context, int i) {
//                       return ListTile(
//                         title: Text("index $i"),
//                       );
//                     },
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     controller: controller,
//                     padding: EdgeInsets.only(top: 50.0),
//                   );
//                 },
//               ),
//               Filter(),
//             ],
//           )),
//     );
//   }
// }
