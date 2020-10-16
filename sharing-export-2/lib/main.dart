import 'package:flutter/material.dart';
import './screens/home_page.dart';

// https://www.youtube.com/watch?v=DSJ5vONP3XM
// https://medium.com/flutterdevs/sharing-files-in-flutter-66aa4e115256

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Export Demo',
      home: HomePage(),
    );
  }
}
