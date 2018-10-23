import 'dart:async';

import '../dto/test.dart';
import 'base/main.dart';

Future<Test> getData(context) async {
  Map<String, dynamic> map = await HTTP(context: context).get('/getData');
  return new Test.fromJson(map);
}

Future<void> postData(context) async {
  Map<String, dynamic> map = await HTTP(context: context).post('/post', { 'id': 123 });
  print(map);
}

Future<String> getData2() async {
  return Future.delayed(Duration(seconds: 3), () {
    return "hello world";
  });
}
