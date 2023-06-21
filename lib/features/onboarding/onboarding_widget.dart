import 'package:flutter/material.dart';
import 'package:mybank_app/constans/styles.dart';

Widget buildPage({
  required Color color,
  required String urlImage,
  required String title,
  required String subtitle,
}) {
  return Container(
    color: color,
    padding: EdgeInsets.all(25.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          urlImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(height: 18.0),
        Text(
          title,
          style: Styles.onBoardingTitle,
        ),
        const SizedBox(height: 10.0),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Styles.paragraphTextBlack,
        ),
      ],
    ),
  );
}
