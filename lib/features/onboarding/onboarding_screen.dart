import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/styles.dart';
import 'package:mybank_app/features/onboarding/onboarding_data.dart';
import 'package:mybank_app/features/onboarding/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        child: Container(
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
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              height: 50.0,
              width: 250.0,
              margin: Styles.eiBottom35,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
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
            )
          : Container(
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
            ),
    );
  }
}
