import 'package:flutter/material.dart';

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