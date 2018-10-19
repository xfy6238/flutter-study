import 'dart:io';
import 'dart:convert';

void main() async {
  NetworkInterface.list().then((List<NetworkInterface> interfaces) {
    final InternetAddress ip = interfaces[1].addresses[0];
    Socket.connect(ip.address, 3200).then((Socket socket) {
      socket.write("hello, server");
      socket.listen((data) {
        print(utf8.decode(data));
      }, onDone: () {
        print("done");
      }, onError: (err) {
        print(err);
      });
    });
  });
}
