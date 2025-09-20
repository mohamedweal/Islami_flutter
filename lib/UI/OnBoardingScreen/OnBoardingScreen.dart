import 'package:flutter/material.dart';
import 'package:islami/UI/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../design.dart';
import 'onboard.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: Onboard.onboardingPages.length,
            itemBuilder: (context, index) {
              final data = Onboard.onboardingPages[index];
              return OnboardingContent(
                image: data.image,
                title: data.title,
                description: data.description,
              );
            },
          ),
        ],
      ),
      bottomSheet: Container(
        color: AppColors.black,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_currentPage > 0)
              TextButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Text(
                  'Back',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            else
              SizedBox(width: 70),
            SmoothPageIndicator(
              controller: _pageController,
              count: Onboard.onboardingPages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.gold,
                dotColor: AppColors.grey,
                dotWidth: 8,
                dotHeight: 8,
                spacing: 4,
              ),
            ),
            if (_currentPage < Onboard.onboardingPages.length - 1)
              TextButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Text(
                  "Next",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            if (_currentPage == Onboard.onboardingPages.length - 1)
              TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('onboarding_complete', true);
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.SplashScreen.route,
                  );
                },
                child: Text(
                  "Finish",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.onboarding_logo),
          Image.asset(image, width: 380),
          const Spacer(),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.gold),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.gold),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
