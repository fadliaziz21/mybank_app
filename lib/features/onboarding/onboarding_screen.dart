import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/onboarding/data/onboarding_data.dart';
import 'package:mybank_app/features/onboarding/widget/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constans/font_styles.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: _buildBody(),
        ),
        bottomSheet: isLastPage
            ? onBoardingGetStartedContainer()
            : onBoardingContainer());
  }

  Widget _buildBody() {
    return Container(
      padding: Styles.eiBottom60,
      child: PageView.builder(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            isLastPage = index == onboardingList.length - 1;
          });
        },
        itemCount: onboardingList.length,
        itemBuilder: (context, index) {
          return OnBoardPage(
            color: onboardingList[index].color,
            urlImage: onboardingList[index].urlImage,
            title: onboardingList[index].title,
            subtitle: onboardingList[index].subtitle,
          );
        },
      ),
    );
  }

  onBoardingContainer() {
    return Container(
      padding: Styles.eiSymetric15,
      height: 80.0,
      color: AppColors.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              controller.jumpToPage(onboardingList.length - 1);
            },
            child: const Text(
              'Skip',
              style: FontStyles.textPrimary16bold,
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: onboardingList.length,
              onDotClicked: (index) {
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              effect: const SlideEffect(
                activeDotColor: AppColors.primaryColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
            },
            child: const Text(
              'Next',
              style: FontStyles.textPrimary16bold,
            ),
          ),
        ],
      ),
    );
  }

  onBoardingGetStartedContainer() {
    return Container(
      width: 250.0,
      height: 50.0,
      margin: Styles.eiBottom35,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: Styles.borderRadCircular25,
            ),
          ),
        ),
        onPressed: () async {
          Navigator.pushNamed(context, '/home');
        },
        child: const Text(
          'Get Started',
          style: FontStyles.textWhite,
        ),
      ),
    );
  }
}
