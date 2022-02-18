import 'package:flutter/material.dart';
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
    for (int i=0; i <= numbersAdded; i++) {
      countdownTime = countdownTime.replaceFirst(RegExp('0'), currentTimeInput[i], 6 - numbersAdded);
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
              Center(
                child: Container(
                  child: Text(
                      "$countdownTime",
                      style: TextStyle(
                        color: appSecondaryColour,
                        fontSize: 60,
                      ),
                  ),
                ),
              ),
              Center(
                child: Container(
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