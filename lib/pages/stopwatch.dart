import 'package:flutter/material.dart';
import 'package:timer_app/exports.dart';
import 'package:timer_app/constants.dart';

class StopWatchPage extends StatefulWidget {
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appPrimaryColour,
        body: Text("Stopwatch", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}