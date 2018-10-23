import 'package:rxdart/rxdart.dart';
import 'services/exampl.dart' show getData2;

class Model {
  var _title = new PublishSubject<String>();

  get title => _title.stream;

  setTitle(String value) {
    _title.add(value);
  }

  getData() {
    getData2().then((value) {
      setTitle(value);
    });
  }

  close() {
    _title.close();
  }
}