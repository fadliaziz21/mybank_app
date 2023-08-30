import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/font_styles.dart';
import 'package:mybank_app/constans/styles.dart';

class LoginButtonScreen extends StatelessWidget {
  final String buttonName;
  final Function() onPressed;
  const LoginButtonScreen(
      {super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.whiteColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: Styles.borderRadCircular25,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: FontStyles.textPrimary16bold,
      ),
    );
  }
}

class LoginInfoScreen extends StatelessWidget {
  final String infoText;
  final String textButton;
  final Function() onTap;
  const LoginInfoScreen(
      {super.key,
      required this.infoText,
      required this.textButton,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          infoText,
          style: FontStyles.textWhite12,
        ),
        Styles.horizontalBreak5,
        InkWell(
          onTap: onTap,
          child: Text(
            textButton,
            style: FontStyles.textWhite12bold,
          ),
        ),
      ],
    );
  }
}
