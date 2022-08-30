import 'package:bottom_bar/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class My3Page extends StatefulWidget {
  const My3Page({Key? key}) : super(key: key);

  @override
  State<My3Page> createState() => _My3PageState();
}

class _My3PageState extends State<My3Page> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    // context.read<IndexController>().setIndex(false);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('3'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            // （2） 実際に表示するページ(ウィジェット)を指定する
            builder: (context) => MyApp(),
          ));
        },
        child: Text(
          "1.Normal Button",
        ),
      ),
    );
  }
}
