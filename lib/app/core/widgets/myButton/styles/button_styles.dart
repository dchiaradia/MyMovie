import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie2/app/core/widgets/app_colors.dart';

const double radiusSize = 8;

ButtonStyle darkBlueColor() {
  return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(myDarkBlueColor),
      foregroundColor: MaterialStateProperty.all(myWhiteColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSize))),
      textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      )));
}

ButtonStyle whiteColor() {
  return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(myWhiteColor),
      foregroundColor: MaterialStateProperty.all(myDarkBlueColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusSize),
        side: BorderSide(width: 1.0, color: myDarkBlueColor),
      )),
      textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      )));
}

ButtonStyle defaultColor() {
  return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSize))),
      textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )));
}

ButtonStyle buttonRedColor() {
  return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(Colors.red),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSize))),
      textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )));
}

ButtonStyle yellowLightColor() {
  return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(myYellowLightColor),
      foregroundColor: MaterialStateProperty.all(myBlackColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSize))),
      textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      )));
}

ButtonStyle yellowMediumColor() {
  return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(myYellowMediumColor),
      foregroundColor: MaterialStateProperty.all(myBlackColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSize))),
      textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      )));
}

ButtonStyle greyLightColor() {
  return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(myGreyLightColor),
      foregroundColor: MaterialStateProperty.all(myBlackColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSize))),
      textStyle: MaterialStateProperty.all(TextStyle(
        fontFamily: 'Rubik',
        fontStyle: FontStyle.normal,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      )));
}
