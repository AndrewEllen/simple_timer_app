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

  setTimer(String time) {
    int numericalTime = int.parse(time);
    int hours, minutes, seconds;
    
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
    for (int i=0; i < numbersAdded; i++) {
      countdownTime = countdownTime.substring(0,6 - numbersAdded) + currentTimeInput;
      //final replaced = myString.replaceFirst(RegExp('e'), '*', startIndex);  // hello h*llo
    }
    print(time);
  }

/*  removeTime(String inputValue) {
    setState(() {
      countdownTime = countdownTime.substring(0, countdownTime.length - 1);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appPrimaryColour,
        body: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.only(top:150),
                  child: Text(
                    "${countdownTime.substring(0,2)}:${countdownTime.substring(2,4)}:${countdownTime.substring(4,6)}",
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
                  padding: EdgeInsets.only(top:325),
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
                    rightIcon: Icon(Icons.backspace, color: appSecondaryColour),
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