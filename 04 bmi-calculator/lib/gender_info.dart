import 'package:flutter/material.dart';

class GenderInfo extends StatelessWidget {
  GenderInfo({@required this.icon, this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8D98),
          ),
        ),
      ],
    );
  }
}