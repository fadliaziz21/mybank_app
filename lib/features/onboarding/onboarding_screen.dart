import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/features/onboarding/onboarding_data.dart';
import 'package:mybank_app/features/onboarding/onboarding_widget.dart';
import 'package:mybank_app/main.dart';
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
          padding: const EdgeInsets.only(bottom: 60.0),
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
              margin: const EdgeInsets.only(
                bottom: 35.0,
              ),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      // side: BorderSide(color: AppColors.mainColor),
                    ),
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              title: 'Home Pages',
                            )),
                  );
                },
                child: Text(
                  'Get Started',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              height: 80.0,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.jumpToPage(onboardingList.length - 1);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
