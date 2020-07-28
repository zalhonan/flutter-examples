import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // переменная забирает данные из аргументов
    final String args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text('Go Back To Screen 1, $args'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}