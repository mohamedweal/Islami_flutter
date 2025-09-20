import 'package:flutter/material.dart';
import 'package:islami/UI/ChapterDetails/chapterDetails.dart';
import 'package:islami/UI/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:islami/UI/SplashScreen.dart';
import 'package:islami/UI/home/HomeScreen.dart';
import 'package:islami/UI/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/design.dart';

// Declare initialRoute as a global variable
String initialRoute = AppRoutes.SplashScreen.route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  bool onboardingComplete = prefs.getBool('onboarding_complete') ?? false;

  if (onboardingComplete) {
    initialRoute = AppRoutes.SplashScreen.route;
  } else {
    initialRoute = AppRoutes.Onboarding.route;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      // Use the dynamically determined initialRoute
      initialRoute: initialRoute,
      routes: {
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.ChapterDetails.route: (context) => ChapterDetails(),
        AppRoutes.SplashScreen.route: (context) => SplashScreen(),
        AppRoutes.Onboarding.route: (context) => OnboardingScreen(),
      },
    );
  }
}
