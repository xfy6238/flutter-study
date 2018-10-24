import 'package:flutter/material.dart';
import '../rx.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Model model = new Model();
    return Scaffold(
      appBar: AppBar(
        title: Text("about"),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          model.close();
        },),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: model.title,
          initialData: "a",
          builder: (context, snapshot) {
            if (snapshot.data.isNotEmpty) {
              return Text("我的得分: ${snapshot.data}");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
