import 'package:flutter/material.dart';
import 'package:mybank_app/features/onboarding/onboarding_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();

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
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              // fontWeight: FontWeight.bold,
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
          padding: EdgeInsets.only(bottom: 60),
          child: PageView.builder(
            controller: controller,
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
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.00),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                controller.jumpToPage(2);
              },
              child: Text('Skip'),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                // effect: WormEffect(
                //   spacing: 16,
                //   dotColor: Colors.black26,
                //   activeDotColor: Colors.teal.shade700,
                // ),
                onDotClicked: (index) {
                  controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
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
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
