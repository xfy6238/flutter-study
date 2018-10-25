import 'package:flutter/material.dart';
import 'package:flutter_app/pages/bottomSelect.dart';
import '../rx.dart';
import '../utils/storage.dart';

class Home extends StatelessWidget {
  void getData(data) {
    print(data);
  }

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
      body: BottomSelect(
        getData: this.getData,
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Storage.setItem("key", "value").then((a) {
      //       Navigator.of(context).pushNamed("/about");
      //     });
      //   },
      // ),
    );
  }
}
