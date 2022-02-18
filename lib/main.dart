import 'package:timer_app/constants.dart';
import 'package:flutter/material.dart';
import 'exports.dart';

void main() {
  runApp(AppMain());
}

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        fontFamily: 'Impact',
      ),
      color: appPrimaryColour,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => MainPage(),
        '/timer': (_) => TimerPage(),
        '/stopwatch': (_) => StopWatchPage(),
        '/alarm': (_) => AlarmPage(),
      }
    );
  }
}