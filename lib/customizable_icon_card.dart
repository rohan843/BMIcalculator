import 'package:flutter/material.dart';
import 'reusable_card.dart';

const Color kActiveCardColor = Color(0xff1c1c2d);
const Color kInactiveCardColor = Color(0xff141228);
const Color kActiveTextColor = Color(0xffffffff);
const Color kInactiveTextColor = Color(0xff808080);
const Color kActiveIconColor = Color(0xffe2e2e2);
const Color kInactiveIconColor = Color(0xff999898);

class CustomizableIconCard extends StatelessWidget {
  CustomizableIconCard(
      {@required this.icon,
      @required this.text,
      @required this.active,
      @required this.action});

  final IconData icon;
  final String text;
  final bool active;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: ReusableCard(
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 90,
              color: active ? kActiveIconColor : kInactiveIconColor,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              text,
              style: TextStyle(
                color: active ? kActiveTextColor : kInactiveTextColor,
              ),
            ),
          ],
        ),
        colour: active ? kActiveCardColor : kInactiveCardColor,
      ),
    );
  }
}
