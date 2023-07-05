import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';

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
          contentPadding: EdgeInsets.all(15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          filled: true,
          fillColor: fieldPinCondition ? Colors.white : AppColors.dangerColor,
        ),
        style: Styles.pinInputText,
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
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white24,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        height: 60.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        onPressed: onPressed,
        child: Text(
          '$keyNum',
          textAlign: TextAlign.center,
          style: Styles.pinKeyNumText,
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
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white24,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        height: 60.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        onPressed: onPressed,
        child: Icon(
          iconName,
          color: Colors.white,
        ),
      ),
    );
  }
}
