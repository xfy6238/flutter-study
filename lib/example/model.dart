import 'dart:async';
import 'product.dart';

class Model {
  final List<Product> list = [];
  final listCtrl = StreamController<List>();

  get productList => listCtrl.stream;

  void add(Product product) {
    list.add(product);
    listCtrl.add(list);
  }

  void sub(Product product) {
    final index = list.indexWhere((item) => item.content == product.content);
    if (index != -1) {
      list.removeAt(index);
      listCtrl.add(list);
    }
  }

  Map getList() {
    final Map map = new Map();
    list.forEach((item) {
      if (map.containsKey(item.content)) {
        map.update(item.content, (m) => Product(color: item.color, content: item.content, amount: m.amount + 1));
      } else {
        map.putIfAbsent(item.content, () => Product(color: item.color, content: item.content, amount: 1));
      }
    });
    return map;
  }

  void dispose() {
    listCtrl.close();
  }
}

final model = new Model();
