import 'package:flutter/material.dart';

enum Gender { male, female }

Color kTextColor = Color(0xFF8D8E98);
Color kPinkyBack = Color(0xFFEB1555);
Color kActiveCardBack = Color(0xFF1D1E33);
Color kPassiveCardBack = Color(0xFF111328);

// копируем темную тему с модификацией цветов
ThemeData myTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xFF0A0E21),
  scaffoldBackgroundColor: Color(0xFF0A0E21),
  accentColor: Colors.purple,
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.white),
  ),
);

TextStyle kHeadersStyle = TextStyle(
  fontSize: 18,
  color: kTextColor,
);

TextStyle kNumbersStyle = TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
