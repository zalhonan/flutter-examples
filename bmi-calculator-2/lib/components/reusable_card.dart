import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;

  ReusableCard({this.color = const Color(0xFF1D1E33), this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: double.infinity,
//      height: double.infinity,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: child),
    );
  }
}
