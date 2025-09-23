import 'package:flutter/material.dart';
import 'package:islami/UI/ChapterDetails/chapterDetails.dart';
import 'package:islami/UI/Common/MostRecentSharedPrefences.dart'; // Adjusted path based on your screenshot
import 'package:islami/UI/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:islami/UI/SplashScreen.dart';
import 'package:islami/UI/design.dart'; // Corrected import path for AppThemes
import 'package:islami/UI/home/HomeScreen.dart';
import 'package:islami/UI/routes.dart';
// Imports for the Most Recent functionality (from your first code snippet)
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/Provider/MostResentProvider.dart'; // Adjusted path based on your screenshot

// Declare initialRoute as a global variable
String initialRoute = AppRoutes.SplashScreen.route;

void main() async {
  // Ensures that plugin services are initialized before calling runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize MostRecentSharedPreferences (from the first code snippet)
  await MostRecentSharedPreferences.init();

  // Load onboarding status from SharedPreferences (from your second code snippet)
  final prefs = await SharedPreferences.getInstance();
  bool onboardingComplete = prefs.getBool('onboarding_complete') ?? false;

  // Determine the initial route based on onboarding status
  if (onboardingComplete) {
    initialRoute = AppRoutes.SplashScreen.route;
  } else {
    initialRoute = AppRoutes.Onboarding.route;
  }

  // Run the app, wrapping MyApp with ChangeNotifierProvider for MostRecentProvider
  // This makes MostRecentProvider accessible throughout the app's widget tree.
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure the MostRecentSharedPreferences instance is accessible if needed later
    // This call is good practice, though init() in main often suffices for initial setup.
    MostRecentSharedPreferences.getInstance();

    return MaterialApp(
      title: 'Islami',
      // Define dark theme from your design file
      darkTheme: AppThemes.darkTheme,
      // Always use dark theme
      themeMode: ThemeMode.dark,
      // Set the dynamically determined initial route
      initialRoute: initialRoute,
      // Define all named routes for your application
      routes: {
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.ChapterDetails.route: (context) => ChapterDetails(),
        AppRoutes.SplashScreen.route: (context) => SplashScreen(),
        AppRoutes.Onboarding.route: (context) => OnboardingScreen(),
      },
    );
  }
}