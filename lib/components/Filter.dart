import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  @override
  FilterState createState() => new FilterState();
}

class FilterState extends State<Filter> {
  bool isFirstActivity = false;
  bool isSecondActivity = false;
  bool isThirdActivity = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Positioned(
      child: Container(
        width: width,
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            border: Border(bottom: BorderSide(width: 0.5))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFirstActivity = !isFirstActivity;
                  });
                  Scaffold
                      .of(context).showBottomSheet((BuildContext context) {
                        return Text("hello world");
                  });
                },
                child: Row(
                  children: <Widget>[
                    Text("入库日期"),
                    Icon(Icons.arrow_drop_down,
                        color: isFirstActivity ? Colors.blue : null)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSecondActivity = !isSecondActivity;
                  });
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: <Widget>[
                    Text("入库仓库"),
                    Icon(Icons.arrow_drop_down,
                        color: isSecondActivity ? Colors.blue : null)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isThirdActivity = !isThirdActivity;
                  });
                },
                child: Row(
                  children: <Widget>[
                    Text("筛选"),
                    Icon(
                      Icons.filter_list,
                      color: isThirdActivity ? Colors.blue : null,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            )
          ],
        ),
      ),
      top: 0.0,
      left: 0.0,
    );
  }
}
