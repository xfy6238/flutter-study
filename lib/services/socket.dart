import 'dart:io';
import 'dart:convert';

void main() async {
  Socket.connect(InternetAddress.loopbackIPv4, 3200).then((Socket socket) {
    socket.write("hello, server");
    socket.listen((data) {
      print(utf8.decode(data));
    }, onDone: () {
      print("done");
    }, onError: (err) {
      print(err);
    });
  });
}
