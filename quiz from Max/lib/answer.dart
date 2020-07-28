import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Answer({this.answerText, this.onPressed});

  final String answerText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.purple,
        textColor: Colors.white,
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
