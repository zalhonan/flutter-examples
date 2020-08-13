import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../components/numbers_line.dart';
import '../components/change_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

double bottomContainerHeight = 80;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender myGender = Gender.male;
  double myHeight = 170;
  double myWeight = 60;
  double myAge = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      color: myGender == Gender.male
                          ? kActiveCardBack
                          : kPassiveCardBack,
                      child: CardContent(
                        icon: FontAwesomeIcons.mars,
                        iconText: 'MALE',
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        myGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      color: myGender == Gender.female
                          ? kActiveCardBack
                          : kPassiveCardBack,
                      child: CardContent(
                        icon: FontAwesomeIcons.venus,
                        iconText: 'FEMALE',
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        myGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kHeadersStyle,
                  ),
                  Container(
                    height: 5,
                  ),
                  NumbersLine(
                    measures: 'cm',
                    numbers: myHeight,
                  ),
                  Container(
                    height: 5,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                          disabledThumbRadius: 20, enabledThumbRadius: 20),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                        activeColor: kPinkyBack,
                        inactiveColor: kTextColor,
                        min: 50,
                        max: 250,
                        value: myHeight.toDouble(),
                        label: myHeight.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            myHeight = value.round().toDouble();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGTH',
                          style: kHeadersStyle,
                        ),
                        NumbersLine(
                          measures: 'kg',
                          numbers: myWeight,
                        ),
                        Container(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ChangeButton(
                              icon: Icons.exposure_neg_1,
                              actionFunc: () {
                                setState(() {
                                  myWeight--;
                                });
                              },
                            ),
                            Container(
                              width: 10,
                            ),
                            ChangeButton(
                              icon: Icons.exposure_plus_1,
                              actionFunc: () {
                                setState(() {
                                  myWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kHeadersStyle,
                        ),
                        NumbersLine(
                          measures: 'yo',
                          numbers: myAge,
                        ),
                        Container(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ChangeButton(
                              icon: Icons.exposure_neg_1,
                              actionFunc: () {
                                setState(() {
                                  myAge--;
                                });
                              },
                            ),
                            Container(
                              width: 10,
                            ),
                            ChangeButton(
                              icon: Icons.exposure_plus_1,
                              actionFunc: () {
                                setState(() {
                                  myAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: bottomContainerHeight,
              color: kPinkyBack,
              child: Center(
                child: Text(
                  'Count my BMI',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onTap: () {
              double bmi = myWeight / pow(myHeight / 100, 2);
              Navigator.pushNamed(context, '/result', arguments: bmi);
            },
          ),
        ],
      ),
    );
  }
}
