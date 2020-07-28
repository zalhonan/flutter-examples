import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  Quiz({this.currentQuestion, this.questions, this.answerQuestion});

  int currentQuestion;
  dynamic questions;
  Function answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText:
              'Current question: $currentQuestion, ${questions[currentQuestion]['question']}',
        ),
        Container(
          margin: EdgeInsets.all(10),
        ),
        for (var answer in questions[currentQuestion]['answers'])
          Answer(
            answerText: answer['text'],
            // тут анонимка - как передать значение в функцию
            onPressed: () => answerQuestion(answer['score']),
          ),
      ],
    );
  }
}
