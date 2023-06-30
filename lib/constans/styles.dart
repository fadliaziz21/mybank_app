import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/font_family.dart';

class Styles {
  static const TextStyle onBoardingTitle = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const TextStyle paragraphTextBlack = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  static const TextStyle paragraphTextWhite = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  );

  static const TextStyle pinKeyNumText = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle pinInputText = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const SizedBox lineBreak25 = SizedBox(
    height: 25.0,
  );

  static const BoxShadow smallBoxShadow = BoxShadow(
    color: AppColors.secondaryColor,
    spreadRadius: 1.0,
    blurRadius: 10.0,
    offset: Offset(0.0, 1.0),
  );

  static const BoxShadow mediumBoxShadow = BoxShadow(
    color: AppColors.secondaryColor,
    spreadRadius: 3.0,
    blurRadius: 15.0,
    offset: Offset(0.0, 1.0),
  );

  static const BorderRadius topBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );

  static const BorderRadius bottomBorderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(25.0),
    bottomRight: Radius.circular(25.0),
  );

  static const EdgeInsets eiBottom10 = EdgeInsets.only(bottom: 10.0);
  static const EdgeInsets eiAll10Top20 =
      EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 10.0);
}
