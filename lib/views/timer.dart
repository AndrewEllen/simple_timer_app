import 'package:flutter/material.dart';
import 'dart:async';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:timer_app/exports.dart';
import 'package:timer_app/constants.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late String countdownTime = "000000";
  late String currentTimeInput = "";
  late int numbersAdded = 0;
  bool _timerSet = false;

  setTimer(String time) async {
    int _hours, _minutes, _seconds;

    _hours = int.parse(time.substring(0, 2));
    _minutes = int.parse(time.substring(2, 4));
    _seconds = int.parse(time.substring(4, 6));

    Timer(Duration(hours: _hours, minutes: _minutes, seconds: _seconds),
        timerCallback);
    //Timer.periodic(Duration(seconds: 1), subtractTime());
    setState(() {
      _timerSet = true;
    });
  }

  subtractTime() {
    setState(() {});
  }

  void timerCallback() {
    setState(() {
      countdownTime = "000000";
      currentTimeInput = "";
      numbersAdded = 0;
      _timerSet = false;
    });
  }

  addTime(String inputValue) {
    setState(() {
      numbersAdded += 1;
      if (numbersAdded <= 6) {
        currentTimeInput += inputValue;
        if (currentTimeInput[0] == "0") {
          currentTimeInput = "";
          numbersAdded = 0;
        }
      } else {
        numbersAdded = 6;
      }
      displayTime(currentTimeInput);
    });
  }

  displayTime(String time) {
    countdownTime = "000000";
    for (int i = 0; i < numbersAdded; i++) {
      countdownTime = countdownTime.substring(0, 6 - numbersAdded) + time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appPrimaryColour,
        body: Center(
          child: _timerSet
              ? Text(
                  "Counting Down...",
                  style: TextStyle(color: Colors.white),
                )
              : Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.only(top: 150),
                        child: Text(
                          "${countdownTime.substring(0, 2)}:${countdownTime.substring(2, 4)}:${countdownTime.substring(4, 6)}",
                          style: TextStyle(
                            color: appSecondaryColour,
                            fontSize: 60,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(top: 325),
                        child: NumericKeyboard(
                          onKeyboardTap: addTime,
                          textColor: appSecondaryColour,
                          rightButtonFn: () {
                            setState(() {
                              numbersAdded -= 1;
                              if (currentTimeInput.length > 0) {
                                currentTimeInput = currentTimeInput.substring(
                                    0, currentTimeInput.length - 1);
                              } else {
                                numbersAdded = 0;
                              }
                            });
                            displayTime(currentTimeInput);
                          },
                          rightIcon: Icon(Icons.backspace,
                              color: appSecondaryColour, size: 26),
                          leftButtonFn: () {
                            if (numbersAdded > 0) {
                              setTimer(countdownTime);
                            } else
                              null;
                          },
                          leftIcon: numbersAdded > 0
                              ? Icon(Icons.check_circle,
                                  color: appSecondaryColour, size: 30)
                              : null,
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
