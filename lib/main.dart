// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:randonauticaflutter/introduction/Introduction.dart';
import 'package:randonauticaflutter/randonaut/Randonaut.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'Login/login_screen.dart';
import 'lab/body.dart';
import 'lab/lab.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedTabIndex = 0;
  double _value = 0;

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  List _pages = [
    BodyLayout(),
    MapSample(),
    LoginScreen(),
    Introduction()
  ];

  _changeIndex(int index) {
    
    setState(() {
      _selectedTabIndex = index;
      if(_selectedTabIndex == 0){ // Achievement view here
        showAchievementViewLab(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedTabIndex]),
      bottomNavigationBar: (
        new Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
             // canvasColor: Colors.lightBlue[900],
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.grey,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))), // sets the inactive color of the `BottomNavigationBar`
          child: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.fiber_manual_record),
                title: new Text("LAB"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.check_circle),
                title: new Text("EXPLORE"),
              ),
              new BottomNavigationBarItem(
                icon: new Image.asset("assets/img/Andronaut.png",
                  height: 50),
                title: new Text("ME"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.accessibility_new),
                title: new Text("introduction"),
              ),
            ],
            currentIndex: _selectedTabIndex,
            selectedItemColor: Colors.blue[800],
            onTap: _changeIndex,
          ),
        )
      ),
    );
  }
}


void showAchievementViewLab(BuildContext context) {
  AchievementView(context,
      title: "Enter the Lab...",
      subTitle: "Becoming a reality scientist!",
      //onTab: _onTabAchievement,
      // icon: Icon(Icons.insert_emoticon, color: Colors.white,),
      icon: new Image.asset("assets/img/Andronaut.png", height: 50),
      //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
      //borderRadius: 5.0,
      //color: Colors.blueGrey,
      //textStyleTitle: TextStyle(),
      //textStyleSubTitle: TextStyle(),
      //alignment: Alignment.topCenter,
      //duration: Duration(seconds: 3),
      //isCircle: false,
      listener: (status) {
        print(status);
        //AchievementState.opening
        //AchievementState.open
        //AchievementState.closing
        //AchievementState.closed
      })
    ..show();
}


