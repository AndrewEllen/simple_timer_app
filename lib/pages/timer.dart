import 'package:flutter/material.dart';
import 'package:timer_app/exports.dart';
import 'package:timer_app/constants.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appPrimaryColour,
        body: Center(
          child: Text(
            "00:00:00",
            style: TextStyle(
              color: appSecondaryColour,
              fontSize: 60,
            ),
          ),
        ),
      ),
    );
  }
}