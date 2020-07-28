import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_info.dart';
import 'reusable_card.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColor = activeCardColor;
                        femaleCardColor = inactiveCardColor;
                      });

                    },
                    child: ReusableCard(
                      child: GenderInfo(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                      colour: maleCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColor = inactiveCardColor;
                        femaleCardColor = activeCardColor;
                      });
                    },
                    child: ReusableCard(
                      child: GenderInfo(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                      colour: femaleCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}




