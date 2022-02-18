import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:timer_app/constants.dart';
import 'package:timer_app/exports.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<CurvedNavigationBarState> _NavigationBarKey = GlobalKey();

  final pages = [
    AlarmPage(),
    TimerPage(),
    StopWatchPage(),
  ];

  int _currentNavigatorIndex = 1;
  int _previousIndex = 1;

  static const List<Widget> itemsunselected = [
    Icon(MdiIcons.alarm, size: 30, color: Colors.white,),
    Icon(MdiIcons.timerSand, size: 30, color: Colors.white,),
    Icon(MdiIcons.timerOutline, size: 30, color: Colors.white,),
  ];

  static final List<Widget> itemsSelected = [
    Icon(MdiIcons.alarm, size: 40, color: appSecondaryColour,),
    Icon(MdiIcons.timerSand, size: 40, color: appSecondaryColour,),
    Icon(MdiIcons.timerOutline, size: 40, color: appSecondaryColour,),
  ];

  late List<Widget> items;

  void initState() {
    items = [...itemsunselected];
    items[_currentNavigatorIndex] = itemsSelected[_currentNavigatorIndex];
    super.initState();
  }

  navBarColor(int index) {
    setState(() {
      _previousIndex = _currentNavigatorIndex;
      _currentNavigatorIndex = index;

      items[_currentNavigatorIndex] = itemsSelected[_currentNavigatorIndex];
      items[_previousIndex] = itemsunselected[_previousIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appPrimaryColour,
        bottomNavigationBar: CurvedNavigationBar(
            key: _NavigationBarKey,
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
            buttonBackgroundColor: appTertiaryColour,
            color: appTertiaryColour,
            index: _currentNavigatorIndex,
            height: 60,
            animationDuration: Duration(milliseconds: 150),
            items: items,
            onTap: (index) {
              navBarColor(index);
            }
        ),
        body: pages[_currentNavigatorIndex],
        ),
    );
  }
}