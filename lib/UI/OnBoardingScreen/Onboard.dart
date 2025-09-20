import '../design.dart';

class Onboard {
  final String image;
  final String title;
  final String description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });

  static final List<Onboard> onboardingPages = [
    Onboard(
      image: AppImages.onboarding_1,
      title: "Welcome To Islami App",
      description: "",
    ),
    Onboard(
      image: AppImages.onboarding_2,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    Onboard(
      image: AppImages.onboarding_3,
      title: "Reading the Quran",
      description: 'Read, and your Lord is the Most Generous',
    ),
    Onboard(
      image: AppImages.onboarding_4,
      title: "Praise the Lord",
      description: "Praise the name of your Lord, the Most High",
    ),
    Onboard(
      image: AppImages.onboarding_5,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
