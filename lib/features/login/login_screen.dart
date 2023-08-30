import 'package:flutter/material.dart';
import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/font_styles.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/login/widget/login_widget.dart';
import 'package:mybank_app/features/otp/otp_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _inputPhoneNumberController =
      TextEditingController();
  bool _isLogin = true;

  _setIsLogin(bool param) {
    setState(() {
      _isLogin = param;
    });
  }

  void _openOTPScreen() {
    if (_inputPhoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(
            milliseconds: 2500,
          ),
          content: Text('Please input your phone number!'),
        ),
      );
    } else {
      showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return const OTPPage();
          });
    }
  }

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
          child: Padding(
            padding: Styles.eiHorizontal20Vertical10,
            child: Column(
              children: [
                Container(
                  margin: Styles.eiTop50,
                  child: Image.asset(
                    Assets.myBankLogo,
                    height: 25.0,
                  ),
                ),
                Styles.lineBreak15,
                Container(
                  width: double.infinity,
                  margin: Styles.eiTop25,
                  padding: Styles.eiAll15,
                  decoration:
                      Styles.decorationAll10BorderLightGreyW1ShadowSmall,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _isLogin
                          ? const Text(
                              'Enter phone number',
                              textAlign: TextAlign.left,
                              style: FontStyles.textLightGrey14bold,
                            )
                          : const Text(
                              'Input phone number to create a new account',
                              textAlign: TextAlign.left,
                              style: FontStyles.textLightGrey14bold,
                            ),
                      Styles.lineBreak15,
                      Row(
                        children: [
                          Container(
                            padding: Styles.eiAll10,
                            decoration: Styles.decorationAll10BorderLightGreyW1,
                            child: Row(
                              children: [
                                Container(
                                  margin: Styles.eiRight5,
                                  decoration:
                                      Styles.decorationBorderLightGreyW1,
                                  child: Image.asset(
                                    Assets.flagIndonesia,
                                    height: 15.0,
                                  ),
                                ),
                                const Text(
                                  '+62',
                                  style: FontStyles.textDark14bold,
                                ),
                              ],
                            ),
                          ),
                          Styles.horizontalBreak15,
                          Expanded(
                            child: Container(
                              height: 42.0,
                              child: TextField(
                                controller: _inputPhoneNumberController,
                                decoration: InputDecoration(
                                  hintText: '812-3456-7890',
                                  hintStyle: FontStyles.textLightGrey14bold,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.clear),
                                    iconSize: 20.0,
                                    color: AppColors.lightGreyColor,
                                    onPressed: () {
                                      return _inputPhoneNumberController
                                          .clear();
                                    },
                                  ),
                                  contentPadding: Styles.eiAll10Top3,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: AppColors.lightGreyColor,
                                    ),
                                  ),
                                  counterText: '',
                                ),
                                style: FontStyles.textDark14bold,
                                keyboardType: TextInputType.number,
                                maxLength: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Styles.lineBreak15,
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration:
                      Styles.decorationAll10BorderLightGreyW1ShadowSmall,
                  child: _isLogin
                      ? LoginButtonScreen(
                          buttonName: 'Log In',
                          onPressed: _openOTPScreen,
                        )
                      : LoginButtonScreen(
                          buttonName: 'Sign Up',
                          onPressed: _openOTPScreen,
                        ),
                ),
                Styles.lineBreak15,
                _isLogin
                    ? LoginInfoScreen(
                        infoText: 'Dont have an account?',
                        textButton: 'Sign Up',
                        onTap: () {
                          _setIsLogin(false);
                        },
                      )
                    : LoginInfoScreen(
                        infoText: 'Already have an account?',
                        textButton: 'Log In',
                        onTap: () {
                          _setIsLogin(true);
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
