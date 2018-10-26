import 'package:flutter/material.dart';

class BottomSelect extends StatelessWidget {
  final Function getData;

  final List<String> ops = ["取消", "确认"];

  BottomSelect({@required this.getData});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return IconButton(
      icon: Icon(Icons.open_in_browser),
      onPressed: () {
        var controller = Scaffold.of(context).showBottomSheet((context) {
          return Container(
              width: width,
              height: 300.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ops.map((item) {
                      return Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SizedBox(
                              width: 110.0,
                              height: 60.0,
                              child: Center(
                                child: Text(item),
                              ),
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  ),
                  _YearMonth(),
                  _Weeks(),
                  _Days(),
                ],
              ));
        });
        controller.closed.whenComplete(() {
          getData("hah");
        });
      },
    );
  }
}

class _YearMonth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.chevron_left),
                Text("11"),
                Icon(Icons.chevron_right),
              ],
            )
          ],
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.chevron_left),
                Text("2018"),
                Icon(Icons.chevron_right),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class _Weeks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final List<String> weeks = [
      "一",
      "二",
      "三",
      "四",
      "五",
      "六",
      "日",
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
        }).toList());
  }
}

class _Days extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    Color white = Colors.white;
    Color blue = Colors.blueAccent;
    List<int> range = [];
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          height: 160.0,
          child: new GridView.count(
            crossAxisCount: 7,
            childAspectRatio: 2.0,
            children: getDays(year: 2018, month: 10).map((item) {
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
                      child: Text("$item", style: TextStyle(color: color == blue ? Colors.white : Colors.black),),
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
