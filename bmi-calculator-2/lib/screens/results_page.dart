import 'package:flutter/material.dart';
import '../constants.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  double bmi;

  @override
  Widget build(BuildContext context) {
    bmi = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('your results here, fatty'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Oh my, your BMI is...',
            style: kHeadersStyle,
          ),
          Container(
            height: 5,
          ),
          Text(
            '${bmi.round()}',
            style: kNumbersStyle,
          ),
        ],
      ),
    );
  }
}
