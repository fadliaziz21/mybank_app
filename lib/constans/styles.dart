import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/font_family.dart';

class Styles {
  static const TextStyle onBoardingTitle = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.mainColor,
  );

  static const TextStyle paragraphTextBlack = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle paragraphTextWhite = TextStyle(
    fontFamily: FontFamily.montserrat,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  );
}
