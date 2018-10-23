import 'package:rxdart/rxdart.dart';

class Model {

  var _title = new PublishSubject<String>();

  Stream get title => _title.stream;

  void setTitle(String value) {
    _title.add(value);
  }


  void close() {
    _title.close();
  }
}