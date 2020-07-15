import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentQuestion = 0;
  int totalScore = 0;

  dynamic questions = [
    {
      'question': 'форком в глаз или в жопу раз?',
      'answers': [
        {'text': 'да', 'score': 1},
        {'text': 'нет', 'score': 0},
        {'text': 'не знаю', 'score': 0}
      ]
    },
    {
      'question':
          'есть два стула, на одном чизкейки печеные, на другом смузи толченые, на какой сам сядешь, на какой коворкера посадишь?',
      'answers': [
        {'text': 'чизкейки', 'score': 0},
        {'text': 'смузи', 'score': 0},
        {'text': 'не знаю', 'score': 0},
        {
          'text':
              'чизкейки съем, смузями запью, сам сяду, коворкера на хуй посажу',
          'score': 1
        }
      ]
    },
    {
      'question':
          'тебе под ноги кинули битый мердж реквест, что делать будешь?',
      'answers': [
        {'text': 'accept', 'score': 0},
        {'text': 'decline', 'score': 0},
        {'text': 'морду автору начищу', 'score': 1}
      ]
    },
  ];

  void answerQuestion(int score) {
    print('answer choosen');
    setState(() {
      currentQuestion += 1;
      totalScore += score;
    });
    print('current: $currentQuestion, score: $totalScore');
  }

  void resetQuiz() {
    setState(() {
      currentQuestion = 0;
      totalScore = 0;
    });
    print('Reset');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('example app'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              // выдача контента по условию тернарным оператором
              child: (currentQuestion < 3)
                  ? Quiz(
                      currentQuestion: currentQuestion,
                      questions: questions,
                      answerQuestion: answerQuestion,
                    )
                  : Result(
                      score: totalScore,
                      resetQuiz: resetQuiz,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
