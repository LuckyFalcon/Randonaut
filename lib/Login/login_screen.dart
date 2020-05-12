import 'dart:convert';

import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:randonauticaflutter/Login/src/HomeScreen.dart';
import '../main.dart';
import 'src/constants.dart';
import 'src/custom_route.dart';
import 'dashboard_screen.dart';
import 'src/users.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  static const routeName = '/authenticate';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String> _loginUser(LoginData data) async {
    final response = await http.post('http://192.168.1.117:3000/authenticate?');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      //Authenticate.fromJson(json.decode(response.body)).toString();
      return "success";
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return FlutterLogin(
      title: Constants.appName,
      logo: 'assets/images/img1.png',
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      emailValidator: (value) {
        if (!value.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => MyApp(),
        ));
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
      showDebugButtons: false,
    );
  }
}

class Authenticate {
  bool administrator;
  String sId;
  String username;
  String email;
  String createdDate;
  int iV;
  String token;

  Authenticate(
      {this.administrator,
        this.sId,
        this.username,
        this.email,
        this.createdDate,
        this.iV,
        this.token});

  Authenticate.fromJson(Map<String, dynamic> json) {
    administrator = json['administrator'];
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    createdDate = json['createdDate'];
    iV = json['__v'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['administrator'] = this.administrator;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['createdDate'] = this.createdDate;
    data['__v'] = this.iV;
    data['token'] = this.token;
    return data;
  }
}
