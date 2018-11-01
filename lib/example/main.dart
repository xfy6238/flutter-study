import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'product.dart';
import 'badge.dart';
import 'model.dart' show model;

class Shop extends StatelessWidget {
  final List<Product> colors = [
    Product(color: Colors.green, content: "苹果手机"),
    Product(color: Colors.red, content: "三星手机"),
    Product(color: Colors.blue, content: "华为手机"),
    Product(color: Colors.pink, content: "小米手机"),
    Product(color: Colors.orange, content: "魅族手机"),
    Product(color: Colors.yellow, content: "其他手机"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("产品列表"),
        centerTitle: true,
        actions: <Widget>[
          StreamBuilder(
              stream: model.productList,
              initialData: [],
              builder: (context, snapshot) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/product");
                  },
                  child: Badge(
                    count: snapshot.data.length,
                  ),
                );
              }),
          Icon(Icons.apps),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: colors.map((item) {
          return InkWell(
            onTap: () {
              model.add(item);
            },
            child: Container(
              decoration: BoxDecoration(color: item.color),
              child: Center(
                child: Text(item.content),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
