import 'package:flutter/material.dart';
import '../constants.dart';

class ChangeButton extends StatelessWidget {
  IconData icon;
  Function actionFunc;

  ChangeButton({this.icon, this.actionFunc});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kTextColor,
      child: Icon(
        icon,
        size: 36,
        color: Colors.white,
      ),
      onPressed: actionFunc,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
    );
  }
}

//Widget build(BuildContext context) {
//  return FloatingActionButton(
//    backgroundColor: kTextColor,
//    child: Icon(
//      icon,
//      size: 36,
//      color: Colors.white,
//    ),
//    onPressed: actionFunc,
//  );
//}
