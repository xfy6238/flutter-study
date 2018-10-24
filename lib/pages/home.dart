import 'package:flutter/material.dart';
import '../rx.dart';
import '../utils/storage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Model model = new Model();
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            model.close();
          },
        ),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: model.title,
          initialData: "a",
          builder: (context, snapshot) {
            if (snapshot.data.isNotEmpty) {
              return InkWell(
                child: Text("data"),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Storage.setItem("key", "value").then((a) {
            Navigator.of(context).pushNamed("/about");
          });
        },
      ),
    );
  }
}
