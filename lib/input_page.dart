import 'customizable_icon_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';

const double kBottomContainerHeight = 78;
const Color kBottomContainerColor = Color(0xffEB114D);
const TextStyle kNumberStyling = TextStyle(
  color: kActiveTextColor,
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const TextStyle kLabelStyle = TextStyle(
  color: kInactiveTextColor,
  fontSize: 15,
);

class InputPage extends StatefulWidget {
  // const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { female, male }

class _InputPageState extends State<InputPage> {
  bool maleState = false;
  bool femaleState = false;
  double height = 180;
  int weight = 74;
  int age = 23;

  void updateGender(Gender gender) {
    if (gender == Gender.female) {
      maleState = false;
      femaleState = !femaleState;
    } else if (gender == Gender.male) {
      maleState = !maleState;
      femaleState = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomizableIconCard(
                      action: () {
                        setState(() {
                          updateGender(Gender.male);
                        });
                      },
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                      active: maleState,
                    ),
                  ),
                  Expanded(
                    child: CustomizableIconCard(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                      active: femaleState,
                      action: () {
                        setState(() {
                          updateGender(Gender.female);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.round().toString(),
                          style: kNumberStyling,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            color: kInactiveTextColor,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        inactiveTrackColor: kInactiveTextColor,
                        trackHeight: 1,
                        thumbColor: kBottomContainerColor,
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x2fff0167),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 27,
                        ),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                      ),
                      child: Slider(
                        value: height,
                        onChanged: (newHeight) {
                          setState(() {
                            height = newHeight;
                          });
                        },
                        min: 140,
                        max: 251,
                      ),
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
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyling,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatIconButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 2) weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FlatIconButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 635) weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyling,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatIconButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FlatIconButton(
                                onPressed: () {
                                  setState(() {
                                    if (age < 122) age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(
                top: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlatIconButton extends StatelessWidget {
  // const FlatIconButton({Key? key}) : super(key: key);
  FlatIconButton({@required this.onPressed, @required this.icon});

  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        child: Icon(icon),
        shape: CircleBorder(),
        fillColor: Color(0xff3d3d57),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        disabledElevation: 6,
        elevation: 6,
        clipBehavior: Clip.hardEdge);
  }
}
