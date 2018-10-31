import 'dart:async';
import 'product.dart';

class Model {
  final List<Product> list = [];
  final listCtrl = StreamController<List>();

  Stream get productList => listCtrl.stream;

  void add(Product product) {
    list.add(product);
    listCtrl.add(list);
  }

  Map<String, Map> getList() {
    final Map<String, Map> map = new Map();
    list.forEach((item) {
      if (map.containsKey(item.content)) {
        map.update(item.content, (m) {
          m['count'] += 1;
          return m;
        });
      } else {
        map.putIfAbsent(item.content, () => {'color': item.color, 'count': 1});
      }
    });
    return map;
  }

  void dispose() {
    listCtrl.close();
  }
}

final model = new Model();
