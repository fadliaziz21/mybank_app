import 'package:flutter/material.dart';
import 'package:mybank_app/constans/styles.dart';

class OnBoardPage extends StatelessWidget {
  final Color color;
  final String urlImage;
  final String title;
  final String subtitle;
  const OnBoardPage(
      {required this.color,
      required this.urlImage,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
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
}
