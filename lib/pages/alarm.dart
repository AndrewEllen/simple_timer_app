import 'package:flutter/material.dart';
import 'package:timer_app/exports.dart';
import 'package:timer_app/constants.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appPrimaryColour,
        body: Text("Alarm", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}