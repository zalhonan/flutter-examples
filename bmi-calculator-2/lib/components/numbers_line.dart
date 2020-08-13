import 'package:flutter/material.dart';
import '../constants.dart';

class NumbersLine extends StatelessWidget {
  double numbers;
  String measures;

  NumbersLine({this.numbers, this.measures});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '$numbers',
          style: kNumbersStyle,
        ),
        Container(
          width: 5,
        ),
        Text(
          measures,
          style: kNumbersStyle,
        ),
      ],
    );
  }
}
