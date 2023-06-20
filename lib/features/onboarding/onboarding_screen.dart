import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/features/onboarding/onboarding_data.dart';
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

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) {
    return Container(
      color: color,
      padding: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 18.0),
          Text(
            title,
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 60.0),
          child: PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == onboardingList.length - 1;
              });
            },
            itemCount: onboardingList.length,
            itemBuilder: (context, index) {
              return buildPage(
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
              margin: EdgeInsets.only(
                bottom: 50.0,
              ),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.mainColor),
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
                  style: TextStyle(color: Colors.white),
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
                        color: AppColors.mainColor,
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
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      effect: SlideEffect(
                        activeDotColor: AppColors.mainColor,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: AppColors.mainColor,
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
