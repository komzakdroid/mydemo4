import 'package:flutter/material.dart';
import 'package:mydemo4/pages/second_page.dart';
import '../models/DataModel.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController numController = TextEditingController();

  late String text;
  late int num;

  DataModel data = DataModel.empty();

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Empty data received...'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Future _opedSecondPage(String text, int num) async {
    DataModel sendingData = DataModel(text, num);
    Map receivingData = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return SecondPage(sendingData);
    }));
    if (receivingData.isNotEmpty && receivingData.containsKey('data')) {
      data = receivingData['data'];
    } else {
      _showToast(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Transfer data')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    labelText: "Text:",
                    hintText: "Enter text",
                  ),
                ),
                TextField(
                  controller: numController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Number", hintText: "Enter number;"),
                ),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        text = textController.text;
                        num = int.parse(numController.text);
                      });
                      _opedSecondPage(text, num);
                    },
                    color: Colors.amber,
                    child: const Text("Send Data")),
                Text(
                  "${data.text}, ${data.number}",
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ));
  }
}
