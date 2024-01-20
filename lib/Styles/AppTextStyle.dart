import 'package:flutter/material.dart';

class AppTextStyle {

  static TextStyle header1({double fontSize = 22, FontWeight fontWeight = FontWeight.bold, Color fontColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle header2({double fontSize = 20, FontWeight fontWeight = FontWeight.bold, Color fontColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle header3({double fontSize = 18, FontWeight fontWeight = FontWeight.bold, Color fontColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle medium({double fontSize = 16, FontWeight fontWeight = FontWeight.w500, Color fontColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle title({double fontSize = 16, FontWeight fontWeight = FontWeight.w600, Color fontColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle subtitle({double fontSize = 16, FontWeight fontWeight = FontWeight.w500, Color fontColor = Colors.black38}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle normal({double fontSize = 14, FontWeight fontWeight = FontWeight.normal, Color fontColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );
  }

  static TextStyle body({double fontSize = 12, FontWeight fontWeight = FontWeight.normal, Color fontColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );
  }
}