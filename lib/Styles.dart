import 'package:flutter/material.dart';
import 'package:mikkeller/ColorPicker.dart';

class Styles {
  static BoxDecoration strokeAndHardShadow = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(25)),
    border: Border.all(
      color: ColorPicker.mainFontColor,
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: ColorPicker.mainFontColor,
        blurRadius: 0,
        spreadRadius: 0,
        offset: Offset(2, 2),
      ),
    ],
    color: ColorPicker.mainBackgroundColor,
  );

  static TextStyle mikkellerText(double fontSize) {
    return TextStyle(
      fontFamily: 'Mikkeller',
      fontSize: fontSize,
      color: ColorPicker.mainFontColor,
    );
  }
}
