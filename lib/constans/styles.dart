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
}
