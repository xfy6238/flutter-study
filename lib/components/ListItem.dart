import 'package:flutter/material.dart';

enum Status {
  done,
  success,
  undone
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
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(
              left: 15.0, right: 10.0, top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color: new Color(0xffffffff),
              border: new Border(bottom: new BorderSide(color: new Color(0xeeeeeeee)))),
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
                              width: 15.0,
                              height: 15.0,
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