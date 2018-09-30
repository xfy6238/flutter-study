import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/ListItem.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter',
      theme: new ThemeData(primaryColor: Colors.blueAccent),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("My Flutter"),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new ListItem(
                billNo: "ZY112222333",
                billName: "十三供应商",
                time: "2018-09-30",
                statusText: "已验收",
                status: Status.done,
              ),
              new ListItem(
                billNo: "ZY112222333",
                billName: "十三供应商",
                time: "2018-09-30",
                statusText: "已成功",
                status: Status.success,
              ),
              new ListItem(
                billNo: "ZY112222333",
                billName: "十三供应商",
                time: "2018-09-30",
                statusText: "未完成",
                status: Status.undone,
              )
            ],
          ),
          decoration: new BoxDecoration(
            color: new Color(0xeeeeeeee)
          ),
        ),
      ),
    );
  }
}

