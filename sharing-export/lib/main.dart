import 'package:flutter/material.dart';
import './screens/cards_list.dart';

// https://www.youtube.com/watch?v=DSJ5vONP3XM

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Export Demo',
      home: CardsList(),
    );
  }
}
