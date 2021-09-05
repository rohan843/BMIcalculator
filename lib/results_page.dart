import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'customizable_icon_card.dart';

class ResultsPage extends StatelessWidget {
  // const ResultsPage({Key? key}) : super(key: key);

  ResultsPage({this.status, this.statusColor, this.bmi, this.message});

  final String status;
  final String message;
  final Color statusColor;
  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.fromLTRB(20, 23, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  padding: EdgeInsets.all(40),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            status,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.3,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            bmi.toStringAsFixed(1),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),

                      // SizedBox(
                      //   height: 30,
                      // ),
                      Column(
                        children: [
                          Text(
                            'Normal BMI range: ',
                            style: TextStyle(
                              color: kInactiveTextColor,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '18.5 - 25 kg/m\u00B2',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: kActiveTextColor,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Save Result',
                          style: TextStyle(
                            color: kActiveTextColor,
                            fontSize: 17,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              kInactiveCardColor),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size.fromHeight(80),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kBottomContainerColor,
                ),
                height: kBottomContainerHeight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'RE-CALCULATE YOUR BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
