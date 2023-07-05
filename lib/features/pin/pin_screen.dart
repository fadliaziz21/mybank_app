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
  bool isPinTrue = true;
  List<String> currentPin = ["", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                ),
                child: Image.asset(
                  Assets.myBankLogo,
                  height: 25,
                ),
              ),
              Styles.lineBreak25,
              Container(
                  child: isPinTrue
                      ? Text(
                          'Enter your PIN code',
                          style: Styles.paragraphTextWhite,
                        )
                      : Text(
                          'Your PIN incorrect. Please try again.',
                          style: Styles.paragraphTextWhite,
                        )),
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
                        fieldPinCondition: isPinTrue,
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
                        for (int i = 1; i <= 3; i++) ...[
                          PinKeyNum(
                            keyNum: i,
                            onPressed: () {
                              pinIndexSetup(i.toString());
                            },
                          ),
                        ],
                      ],
                    ),
                    Styles.lineBreak25,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 4; i <= 6; i++) ...[
                          PinKeyNum(
                            keyNum: i,
                            onPressed: () {
                              pinIndexSetup(i.toString());
                            },
                          ),
                        ],
                      ],
                    ),
                    Styles.lineBreak25,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 7; i <= 9; i++) ...[
                          PinKeyNum(
                            keyNum: i,
                            onPressed: () {
                              pinIndexSetup(i.toString());
                            },
                          ),
                        ],
                      ],
                    ),
                    Styles.lineBreak25,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60.0,
                          width: 60.0,
                        ),
                        PinKeyNum(
                          keyNum: 0,
                          onPressed: () {
                            pinIndexSetup('0');
                          },
                        ),
                        PinKeyIcon(
                          iconName: Icons.backspace,
                          onPressed: () {
                            clearPin();
                          },
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

  pinIndexSetup(String pin) {
    String strPin = '';

    setState(() {
      isPinTrue = true;
    });

    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 6) {
      pinIndex++;
    }

    setPin(pinIndex, pin);
    currentPin[pinIndex - 1] = pin;

    currentPin.forEach((element) {
      strPin += element;
    });

    if (pinIndex == 6) {
      print(strPin);
      pinAuth(strPin);
    }
  }

  setPin(int n, String pin) {
    switch (n) {
      case 1:
        pinOneCtrlr.text = pin;
        break;
      case 2:
        pinTwoCtrlr.text = pin;
        break;
      case 3:
        pinThreeCtrlr.text = pin;
        break;
      case 4:
        pinFourCtrlr.text = pin;
        break;
      case 5:
        pinFiveCtrlr.text = pin;
        break;
      case 6:
        pinSixCtrlr.text = pin;
        break;
    }
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex == 6) {
      setPin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex--;
    } else {
      setPin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex--;
    }
  }

  pinAuth(String pin) {
    String pinDefault = '123456';
    if (pinDefault == pin) {
      print('benar');

      Navigator.pushNamed(context, '/home');
    } else {
      for (int i = 0; i < 6; i++) {
        clearPin();
      }

      setState(() {
        isPinTrue = false;
      });

      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          isPinTrue = true;
        });
      });
    }
  }
}
