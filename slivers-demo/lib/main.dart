import 'package:flutter/material.dart';
import './simple.dart';
import './collapsing_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Simple(),
        appBar: AppBar(title: Text('demo')),
      ),
    );
  }
}
