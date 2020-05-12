import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'attractordetails.dart';
import 'lab.dart';

class Style {
  static final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'

  );
  static final baseTextStyleTitle = const TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold
  );
  static final baseTextStyleActive = const TextStyle(
      fontFamily: 'Poppins',
      color: Colors.red,
      fontSize: 17.0,
      fontWeight: FontWeight.bold
  );
  static final baseTextStyleRadius = const TextStyle(
      fontFamily: 'Poppins'
  );
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
      fontWeight: FontWeight.w400
  );
  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 23.0,
      fontWeight: FontWeight.w600
  );
  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w400
  );
  static final testHeaderStyle = baseTextStyle.copyWith(
      fontFamily: 'Poppins',
      color: const Color(0xffb6b2df),
      fontSize: 18.0,
      fontWeight: FontWeight.w400
  );
}

class BodyLayout extends StatefulWidget {
  @override
  BodyLayoutState createState() {
    return new BodyLayoutState();
  }
}

class BodyLayoutState extends State<BodyLayout> {


  // The GlobalKey keeps track of the visible state of the list items
  // while they are being animated.
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List colors = [Colors.red, Colors.green, Colors.yellow];
  Random random = new Random();

  int index = 0;

  void changeIndex() {
    setState(() => index = random.nextInt(3));
  }

  // backing data
  List<String> _data = ['Sun', 'Moon', 'Star'];

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
          'The Lab',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      body:

    ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider( height: 2, color: Colors.black),

      itemCount: 20,
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, i) {
          return Container(
            child: Card(margin: EdgeInsets.zero,
              child: InkWell(
                onTap: () {
                  // Function is executed on tap.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(attractors[0])),
                  );
                },
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                              'Laughing Allen', style: Style.baseTextStyleTitle),
                        ),
                        new Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 25,
                            width: 70,
                            margin: EdgeInsets.only(top: 5, right: 20),
                            decoration: new BoxDecoration(
                              color: colors[index],
                              // border: Border.all(color: Colors.black, width: 0.0),
                              borderRadius: new BorderRadius.all(Radius.elliptical(100, 90)),
                            ),
                            child: Center(
                                child: Text("4.63", style: Style.baseTextStyleBubbleText,)
                            ),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Row(
                        children: <Widget>[
                          new Image.asset("assets/img/ic_distance.png", height: 12.0),
                          new Container(width: 8.0),
                          new Text("Active",
                            style: Style.baseTextStyleActive,
                          ),
                          new Container(width: 24.0),
                          new Image.asset("assets/img/ic_gravity.png", height: 12.0),
                          new Container(width: 8.0),
                          new Text("2 KM",
                            style: Style.baseTextStyleRadius,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )

//              child:

              // Padding(
              // padding: const EdgeInsets.symmetric(vertical: 15.0),

            ),
          );
        },
      ),
    );
  }
  }

  final attractorCardContent = new Container(
    margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),
    child: new Row(
      children: [
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(height: 4.0),
              new Text("Willy Parkins",
                style: Style.headerTextStyle,
              ),
              new Container(height: 10.0),
              new Text("Dino park",
                  style: Style.baseTextStyle

              ),
              new Container(
                  margin: new EdgeInsets.symmetric(vertical: 8.0),
                  height: 2.0,
                  width: 18.0,
                  color: new Color(0xff00c6ff)
              ),
              new Row(
                children: <Widget>[
                  new Image.asset("assets/img/ic_distance.png", height: 12.0),
                  new Container(width: 8.0),
                  new Text("2500m",
                    style: Style.baseTextStyle,
                  ),
                  new Container(width: 24.0),
                  new Image.asset("assets/img/ic_gravity.png", height: 12.0),
                  new Container(width: 8.0),
                  new Text("test",
                    style: Style.baseTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        new Column(
            children: <Widget>[
              SizedBox(height: 10),
              new IconButton(
                icon: new Icon(Icons.keyboard_arrow_right,
                  size: 60.0,
                  color: Colors.white,
                ),
                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => Randonaut())
//                        //DetailPage(attractor)),
//                  );

                },
              ),
            ]
        )
      ],
    ),
  );

//  // This is the animated row with the Card.
//  Widget _buildItem(String item, Animation animation) {
//    return SizeTransition(
//      sizeFactor: animation,
//      child: Card(
//        child:
//       // Padding(
//         // padding: const EdgeInsets.symmetric(vertical: 15.0),
//          new Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              SizedBox(height: 10),
//              Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Expanded(
//                    flex: 2,
//                    child: Text(
//                        'Laughing Allen', style: Style.baseTextStyleTitle),
//                  ),
//                  new Align(
//                    alignment: Alignment.topRight,
//                    child: Container(
//                      height: 25,
//                      width: 70,
//                      margin: EdgeInsets.only(top: 5, right: 20),
//                      decoration: new BoxDecoration(
//                        color: colors[index],
//                       // border: Border.all(color: Colors.black, width: 0.0),
//                        borderRadius: new BorderRadius.all(Radius.elliptical(100, 90)),
//                      ),
//                      child: Center(
//                          child: Text("4.63", style: Style.baseTextStyleBubbleText,)
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              //SizedBox(height: 0),
//              Padding(
//                padding: const EdgeInsets.symmetric(vertical: 5.0),
//                child: new Row(
//                  children: <Widget>[
//                    new Image.asset("assets/img/ic_distance.png", height: 12.0),
//                    new Container(width: 8.0),
//                    new Text("Active",
//                      style: Style.baseTextStyleActive,
//                    ),
//                    new Container(width: 24.0),
//                    new Image.asset("assets/img/ic_gravity.png", height: 12.0),
//                    new Container(width: 8.0),
//                    new Text("2 KM",
//                      style: Style.baseTextStyleRadius,
//                    ),
//                  ],
//                ),
//              ),
//              SizedBox(height: 10),
//            ],
//          ),
//        ),
//
//     // ),
//    );
//  }

//  void _insertSingleItem() {
//    String newItem = "Planet";
//    // Arbitrary location for demonstration purposes
//    int insertIndex = 2;
//    // Add the item to the data list.
//    _data.insert(insertIndex, newItem);
//    // Add the item visually to the AnimatedList.
//    _listKey.currentState.insertItem(insertIndex);
//  }
//
//  void _removeSingleItem() {
//    int removeIndex = 2;
//    // Remove item from data list but keep copy to give to the animation.
//    String removedItem = _data.removeAt(removeIndex);
//    // This builder is just for showing the row while it is still
//    // animating away. The item is already gone from the data list.
//    AnimatedListRemovedItemBuilder builder = (context, animation) {
//      return _buildItem(removedItem, animation);
//    };
//    // Remove the item visually from the AnimatedList.
//    _listKey.currentState.removeItem(removeIndex, builder);
//  }


//class Attractor {
//  final String id;
//  final String name;
//  final String location;
//  final String distance;
//  final String gravity;
//  final String description;
//  final String image;
//  final String picture;
//
//  const Attractor({this.id, this.name, this.location, this.distance, this.gravity,
//    this.description, this.image, this.picture});
//}
//
//List<Attractor> attractors = [
//  const Attractor(
//    id: "1",
//    name: "Attractor",
//    location: "Near Gorilla Avunue street",
//    distance: "54.6m",
//    gravity: "2.0 ",
//    description: "This Attractor has a radius of 54.6m and falls in the legendary score category. Visiting this point might have interesting results!" ,
//    image: "assets/reacticon.png",
//    picture: "assets/owlbackground.png",
//  ),
//  const Attractor(
//    id: "2",
//    name: "Void",
//    location: "Near ... street",
//    distance: "54.6m",
//    gravity: "3.711 ",
//    description: "Lorem ipsum...",
//    image: "assets/reacticon.png",
//    picture: "assets/owlbackgroundtest.png",
//  ),
//  const Attractor(
//    id: "2",
//    name: "Void",
//    location: "Near ... street",
//    distance: "54.6m",
//    gravity: "3.711 ",
//    description: "Lorem ipsum...",
//    image: "assets/reacticon.png",
//    picture: "assets/owlbackgroundtest.png",
//  ),
//  const Attractor(
//    id: "2",
//    name: "Void",
//    location: "Near ... street",
//    distance: "54.6m",
//    gravity: "3.711 ",
//    description: "Lorem ipsum...",
//    image: "assets/reacticon.png",
//    picture: "assets/owlbackgroundtest.png",
//  ),
//  const Attractor(
//    id: "2",
//    name: "Void",
//    location: "Near ... street",
//    distance: "54.6m",
//    gravity: "3.711 ",
//    description: "Lorem ipsum...",
//    image: "assets/reacticon.png",
//    picture: "assets/owlbackgroundtest.png",
//  ),
//  const Attractor(
//    id: "2",
//    name: "Void",
//    location: "Near ... street",
//    distance: "54.6m",
//    gravity: "3.711 ",
//    description: "Lorem ipsum...",
//    image: "assets/reacticon.png",
//    picture: "assets/owlbackgroundtest.png",
//  ),
//  const Attractor(
//    id: "2",
//    name: "Void",
//    location: "Near ... street",
//    distance: "54.6m",
//    gravity: "3.711 ",
//    description: "Lorem ipsum...",
//    image: "assets/reacticon.png",
//    picture: "assets/owlbackgroundtest.png",
//  )
//];