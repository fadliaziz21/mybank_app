import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';

class Styles {
  static const SizedBox lineBreak15 = SizedBox(
    height: 15.0,
  );
  static const SizedBox lineBreak25 = SizedBox(
    height: 25.0,
  );

  static const BoxShadow boxShadowSmall = BoxShadow(
    color: AppColors.secondaryColor,
    spreadRadius: 0.0,
    blurRadius: 5.0,
    offset: Offset(0.0, 1.0),
  );
  static const BoxShadow boxShadowMedium = BoxShadow(
    color: AppColors.secondaryColor,
    spreadRadius: 1.0,
    blurRadius: 10.0,
    offset: Offset(0.0, 1.0),
  );

  static Decoration decorationBorderLightGreyW1 = BoxDecoration(
    color: AppColors.whiteColor,
    border: Border.all(
      color: AppColors.lightGreyColor,
      width: 1.0,
    ),
  );
  static Decoration decorationAll15BorderLightGreyW1 = BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: borderRadCircular15,
    border: Border.all(
      color: AppColors.lightGreyColor,
      width: 1.0,
    ),
  );
  static Decoration decorationTop15BorderLightGreyW1 = BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: borderRadTop15,
    border: Border.all(
      color: AppColors.lightGreyColor,
      width: 1.0,
    ),
  );
  static Decoration decorationBottom15BorderLightGreyW1 = BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: borderRadBottom15,
    border: Border.all(
      color: AppColors.lightGreyColor,
      width: 1.0,
    ),
  );

  static Decoration decorationCirclePrimary = const BoxDecoration(
    color: AppColors.primaryColor,
    shape: BoxShape.circle,
  );

  static BorderRadius borderRadCircular10 = BorderRadius.circular(10.0);
  static BorderRadius borderRadCircular15 = BorderRadius.circular(15.0);
  static BorderRadius borderRadCircular25 = BorderRadius.circular(25.0);
  static BorderRadius borderRadCircular30 = BorderRadius.circular(30.0);
  static BorderRadius borderRadCircular60 = BorderRadius.circular(60.0);
  static BorderRadius borderRadCircular65 = BorderRadius.circular(65.0);

  static const BorderRadius borderRadTop15 = BorderRadius.only(
    topLeft: Radius.circular(15.0),
    topRight: Radius.circular(15.0),
  );
  static const BorderRadius borderRadTop25 = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );

  static const BorderRadius borderRadBottom15 = BorderRadius.only(
    bottomLeft: Radius.circular(15.0),
    bottomRight: Radius.circular(15.0),
  );
  static const BorderRadius borderRadBottom25 = BorderRadius.only(
    bottomLeft: Radius.circular(25.0),
    bottomRight: Radius.circular(25.0),
  );

  static const EdgeInsets eiAll5 = EdgeInsets.all(5.0);
  static const EdgeInsets eiAll7 = EdgeInsets.all(7.0);
  static const EdgeInsets eiAll10 = EdgeInsets.all(10.0);
  static const EdgeInsets eiAll15 = EdgeInsets.all(15.0);
  static const EdgeInsets eiAll20 = EdgeInsets.all(20.0);
  static const EdgeInsets eiAll25 = EdgeInsets.all(25.0);

  static const EdgeInsets eiAll10Top20 =
      EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0, bottom: 10.0);

  static const EdgeInsets eiLeft5 = EdgeInsets.only(left: 5.0);

  static const EdgeInsets eiTop3 = EdgeInsets.only(top: 3.0);
  static const EdgeInsets eiTop10 = EdgeInsets.only(top: 10.0);
  static const EdgeInsets eiTop20 = EdgeInsets.only(top: 20.0);
  static const EdgeInsets eiTop25 = EdgeInsets.only(top: 25.0);
  static const EdgeInsets eiTop50 = EdgeInsets.only(top: 50.0);

  static const EdgeInsets eiRight5 = EdgeInsets.only(right: 5.0);

  static const EdgeInsets eiBottom10 = EdgeInsets.only(bottom: 10.0);
  static const EdgeInsets eiBottom35 = EdgeInsets.only(bottom: 35.0);
  static const EdgeInsets eiBottom60 = EdgeInsets.only(bottom: 60.0);

  static const EdgeInsets eiHorizontal10Vertical5 =
      EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 5.0);
  static const EdgeInsets eiHorizontal20Vertical10 =
      EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);
  static const EdgeInsets eiHorizontal50Vertical25 =
      EdgeInsets.only(left: 50.0, top: 25.0, right: 50.0, bottom: 25.0);

  static const EdgeInsets eiSymetric15 = EdgeInsets.symmetric(horizontal: 15.0);
}
