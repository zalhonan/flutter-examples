import 'package:flutter/material.dart';
import '../constants.dart';

class CardContent extends StatelessWidget {
  final IconData icon;
  final String iconText;

  CardContent({this.icon, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        Container(
          height: 15,
        ),
        Text(
          iconText,
          style: kHeadersStyle,
        ),
      ],
    );
  }
}
