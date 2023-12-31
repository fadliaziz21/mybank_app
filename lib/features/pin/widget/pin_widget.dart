import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';

import '../../../constans/font_styles.dart';

class PinInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool fieldPinCondition;
  const PinInput(
      {super.key,
      required this.textEditingController,
      required this.fieldPinCondition});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        obscuringCharacter: '●',
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: Styles.eiAll15,
          border: OutlineInputBorder(
            borderRadius: Styles.borderRadCircular10,
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          filled: true,
          fillColor: fieldPinCondition ? Colors.white : AppColors.dangerColor,
        ),
        style: FontStyles.textPrimary16bold,
      ),
    );
  }
}

class PinKeyNum extends StatelessWidget {
  final int keyNum;
  final Function() onPressed;
  const PinKeyNum({super.key, required this.keyNum, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: const BoxDecoration(
        color: AppColors.whiteTransparentColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        height: 60.0,
        shape: RoundedRectangleBorder(
          borderRadius: Styles.borderRadCircular60,
        ),
        onPressed: onPressed,
        child: Text(
          '$keyNum',
          textAlign: TextAlign.center,
          style: FontStyles.textWhite18bold,
        ),
      ),
    );
  }
}

class PinKeyIcon extends StatelessWidget {
  final IconData iconName;
  final Function() onPressed;
  const PinKeyIcon(
      {super.key, required this.iconName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: const BoxDecoration(
        color: AppColors.whiteTransparentColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        height: 60.0,
        shape: RoundedRectangleBorder(
          borderRadius: Styles.borderRadCircular60,
        ),
        onPressed: onPressed,
        child: Icon(
          iconName,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
