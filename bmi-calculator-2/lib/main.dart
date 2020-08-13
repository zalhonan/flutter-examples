import 'package:flutter/material.dart';
import './constants.dart';
import './screens/input_page.dart';
import './screens/results_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultsPage(),
      },
    );
  }
}
