//import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:latlong/latlong.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//import 'dart:io' show Platform;
//
//import 'dashboard.dart';
//
//
//class HomeScreen extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.white);
//
//
//    return Container(
//      decoration: BoxDecoration(color: Color(0xFF202020),),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: [
//          Text('WELCOME!', style: Theme.of(context)
//                  .textTheme
//                  .display1
//                  .copyWith(color: Colors.white)),
//          Image.asset('assets/ButterflyRandonaut.jpg'),
//          Align(
//            alignment: Alignment.center,
//            child: Text(
//              "You're now part of the global phenomena known as The Randonauts.",
//              textAlign: TextAlign.center,
//              style: TextStyle(decoration: TextDecoration.none, fontSize: 14, color: Colors.white),
//            ),
//          ),
//      ButtonTheme(
//        minWidth: 200.0,
//        buttonColor: Colors.white,
//        child: RaisedButton(
//          onPressed: () {
//        //Use`Navigator` widget to push the second screen to out stack of screens
//        Navigator.of(context)
//        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
//            return new GpsScreen();
//        }));},
//          child: Text("BEGIN"),
//        ),
//      )
//        ],
//      )
//    );
//  }
//}
//
//class GpsScreen extends StatelessWidget {
//
//  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
//
//  String stage;
//  Position _currentPosition;
//  String _currentAddress;
//
//  _initLocationPermissions(BuildContext context) async {
//    GeolocationStatus geolocationStatus = await Geolocator().checkGeolocationPermissionStatus();
//    print("location permission granted? ${geolocationStatus.value}");
//
//    await new Future.delayed(const Duration(seconds : 2));
//    stage = "test2";
//    Navigator.of(context)
//        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
//      return new openNavigation();
//    }));
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (Platform.isAndroid) {
//      _initLocationPermissions(context);
//      _getCurrentLocation();
//      print(_currentAddress);
//    } else if (Platform.isIOS) {
//
//
//    }
//    stage = "test";
//    return Container(
//        decoration: BoxDecoration(color: Color(0xFF202020),),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: [
//            Image.asset(
//              "assets/loading.gif",
//              height: 200.0,
//              width: 200.0,
//            ),
//            Align(
//              alignment: Alignment.center,
//              child: Text(
//                stage,
//                textAlign: TextAlign.center,
//                style: TextStyle(decoration: TextDecoration.none, fontSize: 25, color: Colors.white),
//              ),
//            ),
//          ],
//        )
//    );
//  }
//
//
//  _getCurrentLocation() {
//    geolocator
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//        .then((Position position) {
//        _currentPosition = position;
//
//       _getAddressFromLatLng();
//
//    }).catchError((e) {
//      print(e);
//    });
//  }
//
//  _getAddressFromLatLng() async {
//    try {
//      List<Placemark> p = await geolocator.placemarkFromCoordinates(
//          _currentPosition.latitude, _currentPosition.longitude);
//
//      Placemark place = p[0];
//      _currentAddress =
//      "${place.locality}, ${place.postalCode}, ${place.country}";
//
//    } catch (e) {
//      print(e);
//    }
//  }
//
//  _getRngSourcesAvailable() async {
//    try {
//
//
//    } catch (e) {
//      print(e);
//    }
//  }
//
//  _testTemporalRng() async {
//    try {
//
//
//    } catch (e) {
//      print(e);
//    }
//  }
//
//  _testLocalRng() async {
//    try {
//
//
//    } catch (e) {
//      print(e);
//    }
//  }
//
//  _testANURng() async {
//    try {
//
//
//    } catch (e) {
//      print(e);
//    }
//  }
//
//
//
//
//}
//
//class QuantumRNGScreen extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        decoration: BoxDecoration(color: Color(0xFF202020),),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: [
//            Image.asset(
//              "assets/loading.gif",
//              height: 200.0,
//              width: 200.0,
//            ),
//            Align(
//              alignment: Alignment.center,
//              child: Text(
//                "Engaging quantum sources...",
//                textAlign: TextAlign.center,
//                style: TextStyle(decoration: TextDecoration.none,
//                    fontSize: 25,
//                    color: Colors.white),
//              ),
//            ),
//          ],
//        )
//    );
//  }
//
//}
//
//
////Open a new page with a WebView
//class openNavigation extends StatelessWidget {
//  //Example of coordinates
//  static LatLng currentLocation = new LatLng(51.5, -0.09);
//  static LatLng attractorCoordinates = new LatLng(51.7, -0.09);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Randonautica"),
//      ),
//      body: Center(
//          child: WebView(
//            initialUrl: "https://www.google.com/maps/place/" + currentLocation.latitude.toString() + "+" + currentLocation.latitude.toString() + "/@" + attractorCoordinates.latitude.toString() + "+" + attractorCoordinates.latitude.toString() + ",14z",
//            javascriptMode: JavascriptMode.unrestricted,
//          )
//      ),
//    );
//  }
//}
//
