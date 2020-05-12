import 'package:flutter/material.dart';
import 'package:randonauticaflutter/lab/separator.dart';
import 'package:randonauticaflutter/randonaut/Randonaut.dart';

import 'attractor_summary.dart';
import 'body.dart';
import 'lab.dart';

class DetailPage extends StatelessWidget {
  final Attractor attractor;

  DetailPage(this.attractor);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        //MAKE truly invisible, now the map can't be touched!
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          'My Attractor',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            new Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _getBackground(),
                  _getOverview(context),
                  //_getToolbar(context)
                ])
            //A stack is on top of each other
//            _getBackground(),
//           // _getGradient(),
//            _getContent(),
//            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: MapSample(),
      constraints: new BoxConstraints.expand(height: 350.0),
    );
  }

  Container _getOverview(BuildContext context) {
    return new Container(
        constraints: new BoxConstraints.expand(height: 200.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child:
                      Text('Laughing Allen', style: Style.baseTextStyleTitle),
                ),
                new Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 25,
                    width: 70,
                    margin: EdgeInsets.only(top: 5, right: 20),
                    decoration: new BoxDecoration(
                      color: Colors.orange,
                      // border: Border.all(color: Colors.black, width: 0.0),
                      borderRadius:
                          new BorderRadius.all(Radius.elliptical(100, 90)),
                    ),
                    child: Center(
                        child: Text(
                      "4.63",
                      style: Style.baseTextStyleBubbleText,
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  new Image.asset("assets/img/ic_distance.png", height: 12.0),
                  new Container(width: 8.0),
                  new Text(
                    "Active",
                    style: Style.baseTextStyleActive,
                  ),
                  new Container(width: 24.0),
                  new Image.asset("assets/img/ic_gravity.png", height: 12.0),
                  new Container(width: 8.0),
                  new Text(
                    "2 KM",
                    style: Style.baseTextStyleRadius,
                  ),
                  new Container(width: 24.0),
                  new Image.asset("assets/img/ic_gravity.png", height: 12.0),
                  new Container(width: 8.0),
                  new Text(
                    "50 m",
                    style: Style.baseTextStyleRadius,
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  new Text(
                    "Created on 11-5-2020 16:55",
                    style: Style.baseTextStyleRadius,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Container(
                      child: FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Text(
                          "Check in",
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      width: 200.0,
                      height: 75.0,
                    ),
                    new Container(
                      child: FlatButton(
                        color: Colors.grey,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          /*...*/
                        },
                        child: Icon(Icons.directions,
                            color: Colors.black, size: 60),
                      ),
                      width: 75.0,
                      height: 75.0,
                    ),
                    new Container(
                      child: FlatButton(
                        color: Colors.grey,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          /*...*/
                        },
                        child: Icon(Icons.delete, color: Colors.red, size: 60),
                      ),
                      width: 75.0,
                      height: 75.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(0x00736AB7), new Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          new attractorSummary(
            attractor,
            horizontal: false,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  _overviewTitle,
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text(attractor.description, style: Style.testHeaderStyle),
                FlatButton(
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.deepPurple,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Navigate",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.black),
    );
  }
}

class Style2 {
  static final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
  static final baseTextStyleTitle = const TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold);
  static final baseTextStyleActive = const TextStyle(
      fontFamily: 'Poppins',
      color: Colors.red,
      fontSize: 17.0,
      fontWeight: FontWeight.bold);
  static final baseTextStyleRadius = const TextStyle(fontFamily: 'Poppins');
  static final baseTextStyleBubbleText = const TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    fontSize: 15.0,
  );
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 15.0,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 18.0,
      fontWeight: FontWeight.w400);
  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.w600);
  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w400);
  static final testHeaderStyle = baseTextStyle.copyWith(
      fontFamily: 'Poppins',
      color: const Color(0xffb6b2df),
      fontSize: 18.0,
      fontWeight: FontWeight.w400);
}

showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/Andronaut.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    "Checked in!",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Great! Now carefully explore your surroundings. Always procceed with caution. Do not attempt to enter or explore unsafe environments",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 320.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: const Color(0xFF1BC0C5),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
