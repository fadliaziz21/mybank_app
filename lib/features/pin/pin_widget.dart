import 'package:flutter/material.dart';
import 'package:mybank_app/constans/styles.dart';

class PinInput extends StatelessWidget {
  final TextEditingController textEditingController;
  const PinInput({required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

class PinKeyNum extends StatelessWidget {
  final int keyNum;
  final Function() onPressed;
  const PinKeyNum({required this.keyNum, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        height: 90.0,
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
