import 'package:flutter/material.dart';

List onboardingList = [
  _OnboardingItem(
    Colors.white,
    'assets/images/onboarding/mybank_onboarding-1.png',
    'Send & Receive Money',
    'Your virtual wallet is now a reality. Fast and easy way to send and receive money.',
  ),
  _OnboardingItem(
    Colors.white,
    'assets/images/onboarding/mybank_onboarding-2.png',
    'Easy Bank Transfers',
    'National and International transfers at your fingertips',
  ),
  _OnboardingItem(
    Colors.white,
    'assets/images/onboarding/mybank_onboarding-3.png',
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
