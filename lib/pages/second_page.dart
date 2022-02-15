import 'package:flutter/material.dart';
import '../models/DataModel.dart';

class SecondPage extends StatefulWidget {
  static const String id = "second_page";

  DataModel data;

  SecondPage(this.data);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  DataModel newData = DataModel.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Receive data')),
        body: Center(
          child: FlatButton(
            onPressed: () {
              newData.text = "Received";
              newData.number = 1234567;
              Navigator.of(context).pop({'data': newData});
            },
            color: Colors.amber,
            child: Text("${widget.data.text}, ${widget.data.number}"),
          ),
        ));
  }
}
