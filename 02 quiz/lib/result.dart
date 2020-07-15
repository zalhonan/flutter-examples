import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({this.score, this.resetQuiz});

  int score;
  Function resetQuiz;
  dynamic result = {
    0: 'очень плохо',
    1: 'ничего не светит',
    2: 'кое-что верно',
    3: 'отлично!',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Итого: ${result[score]}'),
        Container(
          width: double.infinity,
          child: RaisedButton(
              color: Colors.purple,
              textColor: Colors.white,
              child: Text(
                'Reset',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: resetQuiz),
        ),
      ],
    );
  }
}
