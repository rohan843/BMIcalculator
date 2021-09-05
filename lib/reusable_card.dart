import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.padding});

  final Color colour;
  final Widget cardChild;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(16),
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: colour,
      ),
    );
  }
}
