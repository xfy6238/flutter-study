import "dart:mirrors";
import 'dart:io';

class Page {
  var name;

  method() {
    print('called!');
  }
}

void main() {
  var page = new Page();

  var im = reflect(page);

  // Set values.
  im.setField("name", "some value").then((temp) => print(page.name));

  // Call methods.
  im.invoke("method", []);
}