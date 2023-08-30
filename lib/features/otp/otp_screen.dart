import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/font_styles.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _inputOTPCode = TextEditingController();

  Timer? _countdownTimer;
  Duration _myDuration = const Duration(seconds: 6);

  bool _isShowingTimer = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  /// Timer related methods ///
  void _startTimer() {
    _countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => _setCountDown());
  }

  void _stopTimer() {
    setState(() => _countdownTimer!.cancel());
  }

  void _resetTimer() {
    _stopTimer();
    setState(() => _myDuration = const Duration(seconds: 6));
    setState(() => _isShowingTimer = false);
  }

  void _setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = _myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        _countdownTimer!.cancel();
        setState(() => _isShowingTimer = false);
      } else {
        _myDuration = Duration(seconds: seconds);
      }
    });
  }

  void _resendOTP() {
    _resetTimer();
    _startTimer();
    setState(() => _isShowingTimer = true);

    ScaffoldMessenger.of(context).clearSnackBars;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(
          milliseconds: 1000,
        ),
        content: Text('OTP Code succesfully sent.'),
      ),
    );
  }

  void _verification() async {
    if (_inputOTPCode.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(
            milliseconds: 2500,
          ),
          content: Text('Please input your OTP Code!'),
        ),
      );
    } else {
      if (_inputOTPCode.text == '1234') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('initScreen', 2);

        buildShowDialog();
        Future.delayed(
          const Duration(seconds: 1),
          () => Navigator.pushNamed(context, '/dashboard'),
        );
      } else {
        ScaffoldMessenger.of(context).clearSnackBars;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(
              milliseconds: 2500,
            ),
            content: Text('OTP Code invalid. Please try again'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(_myDuration.inSeconds.remainder(6));

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
          ),
          child: Padding(
            padding: Styles.eiHorizontal20Vertical10,
            child: Column(
              children: [
                Styles.lineBreak25,
                const Text(
                  'Insert OTP Code',
                  textAlign: TextAlign.center,
                  style: FontStyles.textDark18bold,
                ),
                Styles.lineBreak15,
                const Text(
                  'Enter the 4 digit OTP code that was sent to your phone number.',
                  textAlign: TextAlign.center,
                  style: FontStyles.textDark12w500,
                ),
                Styles.lineBreak15,
                Container(
                  width: 100.0,
                  child: TextField(
                    controller: _inputOTPCode,
                    decoration: InputDecoration(
                      contentPadding: Styles.eiAll10Top3,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: AppColors.lightGreyColor,
                        ),
                      ),
                      counterText: '',
                    ),
                    style: FontStyles.textDark18bold,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                  ),
                ),
                Styles.lineBreak15,
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: Styles.borderRadCircular25,
                      ),
                    ),
                  ),
                  onPressed: _verification,
                  child: const Text(
                    'Verification',
                    style: FontStyles.textWhite,
                  ),
                ),
                Styles.lineBreak15,
                _isShowingTimer
                    ? InkWell(
                        onTap: () {},
                        child: Text(
                          'Resend OTP Code in ($seconds s)',
                          style: FontStyles.textLightGrey12,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not received yet?',
                            style: FontStyles.textPrimary12,
                          ),
                          Styles.horizontalBreak5,
                          InkWell(
                            onTap: _resendOTP,
                            child: const Text(
                              'Resend OTP Code',
                              style: FontStyles.textPrimary12bold,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildShowDialog() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
