import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'product.dart';
import 'model.dart' show model;

import 'productList.dart';

void main(List<String> args) {
  debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    home: App(),
    routes: {
      "/product": (context) => ProductCard(),
    },
  ));
}

class App extends StatelessWidget {
  final List<Product> colors = [
    Product(Colors.green, "green"),
    Product(Colors.red, "red"),
    Product(Colors.blue, "blue"),
    Product(Colors.pink, "pink"),
    Product(Colors.orange, "orange"),
    Product(Colors.yellow, "yellow"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: model.productList,
          initialData: [],
          builder: (context, snapshot) {
            return Text("${snapshot.data.length}");
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed("/product");
            },
          )
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
