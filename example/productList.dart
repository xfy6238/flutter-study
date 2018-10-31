import 'package:flutter/material.dart';
import 'model.dart' show model;

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map maps = model.getList();
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text("product"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Column(
        children: maps.keys.map((key) {
          final product = maps[key];
          return Container(
            width: width,
            height: 50.0,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(color: product['color']),
            child: Center(
              child: Text("$key ${product['count']}"),
            ),
          );
        }).toList(),
      ),
    );
  }
}
