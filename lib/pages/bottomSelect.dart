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
              decoration: BoxDecoration(color: Colors.greenAccent),
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
              Text(item),
            ],
          );
        }).toList());
  }
}

class _Days extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> weeks = [
      "一",
      "二",
      "三",
      "四",
      "五",
      "六",
      "日",
    ];
    // DateTime dateTime = new DateTime(2018, 11);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weeks.map((item) {
          return Column(
            children: <Widget>[
              Text(item),
            ],
          );
        }).toList());
  }
}
