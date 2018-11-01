import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final int count;

  Badge({this.count = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Align(
            alignment: Alignment(0.6, -0.4),
            child: Container(
              width: 15.0,
              height: 15.0,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(90.0)
              ),
              child: Center(
                child: Text("$count", style: TextStyle(color: Colors.white, fontSize: 10.0),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
