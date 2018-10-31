import 'dart:async';

import 'package:flutter/material.dart';

class BottomSelect extends StatelessWidget {
  final Function getData;

  BottomSelect({@required this.getData});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.open_in_browser),
      onPressed: () {
        var controller = Scaffold.of(context).showBottomSheet((context) {
          final double width = MediaQuery.of(context).size.width;
          int year = 2018;
          int month = 10;
          return Container(
            width: width,
            height: 300.0,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                _YearMonth(year, month),
                _Weeks(),
                _Days(year, month),
              ],
            ),
          );
        });
        controller.closed.whenComplete(() {
          getData("hah");
        });
      },
    );
  }
}

class _YearMonth extends StatelessWidget {
  final int year;
  final int month;

  _YearMonth(this.year, this.month);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.chevron_left),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 50.0,
                      child: Center(
                        child: Text("$month"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.chevron_left),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 50.0,
                      child: Center(
                        child: Text("$year"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class _Weeks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final List<String> weeks = [
      "周一",
      "周二",
      "周三",
      "周四",
      "周五",
      "周六",
      "周日",
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: weeks.map((item) {
        return Column(
          children: <Widget>[
            SizedBox(
              width: width / 7,
              height: 40.0,
              child: Center(
                child: Text(item),
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}

class _Days extends StatelessWidget {
  final int year;
  final int month;

  _Days(this.year, this.month);
  @override
  Widget build(BuildContext context) {
    int year = this.year;
    int month = this.month;

    Color white = Colors.white;
    Color blue = Colors.blueAccent;

    List<int> range = [];

    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          height: 210.0,
          child: new GridView.count(
            crossAxisCount: 7,
            childAspectRatio: 1.5,
            children: getDays(year: year, month: month).map((item) {
              Color color = white;
              if (range.length == 2) {
                color = item >= range[0] && item <= range[1] ? blue : white;
              } else if (range.length == 1) {
                color = item == range[0] ? blue : white;
              }
              return Center(
                child: InkWell(
                  onTap: () {
                    if (range.length == 2) {
                      range.clear();
                    } else {
                      range.add(item);
                      range.sort();
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: 24.0,
                    width: 24.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: color),
                    child: Center(
                      child: Text(
                        "$item",
                        style: TextStyle(
                            color: color == blue ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

List<int> getDays({int year, int month}) {
  DateTime s = new DateTime(year, month);
  if (month == 12) {
    year += 1;
    month = 0;
  }
  DateTime e = new DateTime(year, month + 1);
  int len = e.difference(s).inDays;
  List<int> days = [];
  for (var i = 0; i < len; i++) {
    days.add(i + 1);
  }
  return days;
}
