import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'config.dart';

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
        body: new ListItem(
          billNo: "ZY112222333",
          billName: "十三供应商",
          time: "2018-09-30",
          statusText: "已验收",
          status: Status.success,
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({this.billNo, this.billName, this.time, this.status, this.statusText});

  final String billNo;
  final Status status;
  final String statusText;
  final String time;
  final String billName;

  Color _getColor() {
    Color color = Colors.green;
    switch(this.status){
      case Status.done:
        color = Colors.green;
        break;
      case Status.undone:
        color = Colors.yellow;
        break;
      case Status.success:
        color = Colors.blue;
        break;
      default:
        break;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(
              left: 15.0, right: 10.0, top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color: new Color(0xcccccccc),
              border: new Border(bottom: new BorderSide(color: Colors.red))),
          child: new Column(
            children: <Widget>[
              new Padding(
                child: new Row(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Text(
                          "订单编号 $billNo",
                          style: new TextStyle(fontSize: 16.0),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Text(
                              statusText,
                              style: new TextStyle(color: this._getColor()),
                            ),
                            new Image.asset(
                              "images/cho-next.png",
                              width: 18.0,
                              height: 18.0,
                            )
                          ],
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              ),
              new Padding(
                child: new Row(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[new Text("创建时间 $time")],
                    ),
                    new Padding(padding: new EdgeInsets.only(right: 40.0)),
                    new Column(
                      children: <Widget>[new Text("供应商 $billName")],
                    )
                  ],
                ),
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              )
            ],
          ),
        )
      ],
    );
  }
}
