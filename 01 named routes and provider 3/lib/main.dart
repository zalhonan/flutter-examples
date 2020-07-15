import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen0.dart';
import 'screen1.dart';
import 'screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // основной виджет оборачивается в провайдер
    // провайдер возвращает объект Data с данными
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Screen0(),
          '/one': (context) => Screen1(),
          '/two': (context) => Screen2(),
        },
//      home: Screen0(),
      ),
    );
  }
}

// дата класс содержит данные
// специальный метод меняет данные и извещает слушателей
// на Screen0 продолжение

class Data extends ChangeNotifier {
  String data = 'Джигурда data';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
