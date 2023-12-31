import 'package:flutter/material.dart';
import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/font_styles.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/pin/data/pin_data.dart';
import 'package:mybank_app/features/pin/widget/pin_widget.dart';

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
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: Styles.eiTop50,
                child: Image.asset(
                  Assets.myBankLogo,
                  height: 25.0,
                ),
              ),
              Styles.lineBreak25,
              pinInfoContainer(),
              Styles.lineBreak25,
              pinInputContainer(),
              Styles.lineBreak25,
              pinKeypadContainer(),
            ],
          ),
        ),
      ),
    );
  }

  pinInfoContainer() {
    return Container(
      child: isPinTrue
          ? const Text(
              'Enter your PIN code',
              style: FontStyles.textWhite16,
            )
          : const Text(
              'Your PIN incorrect. Please try again.',
              style: FontStyles.textWhite16,
            ),
    );
  }

  pinInputContainer() {
    return Container(
      padding: Styles.eiHorizontal50Vertical25,
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
    );
  }

  pinKeypadContainer() {
    return Column(
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
            const SizedBox(
              width: 60.0,
              height: 60.0,
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
      Navigator.pushNamed(context, '/dashboard');
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
