import 'package:flutter/material.dart';
import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/pin/pin_data.dart';
import 'package:mybank_app/features/pin/pin_widget.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  int pinIndex = 0;
  List<String> currentPin = ["", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 25,
                ),
                child: Image.asset(
                  Assets.appLogo,
                  width: 50,
                ),
              ),
              Styles.lineBreak25,
              Container(
                child: Text(
                  'Enter your PIN code',
                  style: Styles.paragraphTextWhite,
                ),
              ),
              Styles.lineBreak25,
              Container(
                padding: EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                  bottom: 25.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < pinInputRowList.length; i++) ...[
                      PinInput(
                        textEditingController: pinInputRowList[i].inputCtrlr,
                      ),
                    ],
                  ],
                ),
              ),
              Styles.lineBreak25,
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PinKeyNum(
                          keyNum: 1,
                          onPressed: () {},
                        ),
                        PinKeyNum(
                          keyNum: 2,
                          onPressed: () {},
                        ),
                        PinKeyNum(
                          keyNum: 3,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
