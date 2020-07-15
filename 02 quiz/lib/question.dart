import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  Question({this.questionText});

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText,
      style: TextStyle(
        fontSize: 21,
      ),
      textAlign: TextAlign.center,
    );
  }
}
