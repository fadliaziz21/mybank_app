import 'package:flutter/material.dart';
import 'package:mybank_app/constans/assets.dart';
import 'package:mybank_app/constans/colors.dart';

List onboardingList = [
  _OnboardingItem(
    AppColors.whiteColor,
    Assets.onboardingImg[1],
    'Send & Receive Money',
    'Your virtual wallet is now a reality. Fast and easy way to send and receive money.',
  ),
  _OnboardingItem(
    AppColors.whiteColor,
    Assets.onboardingImg[2],
    'Easy Bank Transfers',
    'National and International transfers at your fingertips',
  ),
  _OnboardingItem(
    AppColors.whiteColor,
    Assets.onboardingImg[3],
    'Bill Payments',
    'Make hassle free mobile payments from the comfort of your home.',
  ),
];

class _OnboardingItem {
  final Color color;
  final String urlImage;
  final String title;
  final String subtitle;

  _OnboardingItem(this.color, this.urlImage, this.title, this.subtitle);
}
