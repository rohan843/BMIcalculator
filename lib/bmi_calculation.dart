import 'dart:math';
import 'package:flutter/material.dart';

class Calculator {
  double height;
  int weight;
  Calculator({this.height, this.weight});
  double bmi;
  void _setBMI() {
    bmi = weight / (height / 100 * height / 100);
  }

  Map result = {};
  Map getData() {
    _setBMI();
    result['bmi'] = bmi;
    if (bmi < 18.5) {
      result['message'] = "Your BMI is quite low. You should eat more!";
      result['status'] = 'Underweight';
      result['color'] = (Colors.yellow);
    } else if (bmi < 25) {
      result['message'] = ("You have a normal body weight. Good Job!");
      result['color'] = (Color(0xff21A965));
      result['status'] = 'Normal';
    } else {
      result['message'] =
          ('Your BMI is quite high. Exercise more and cut down on those fats!');
      result['color'] = (Colors.redAccent);
      result['status'] = 'Overweight';
    }
    return result;
  }
}
