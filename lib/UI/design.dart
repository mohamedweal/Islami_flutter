import 'package:flutter/material.dart';

class AppColors {
  static const Color gold = Color(0xFFE2BE7F);
  static const Color black = Color(0xFF202020);
  static const Color grey = Color(0xFF707070);
}

class AppImages {
  static const String ic_Quran = "assets/images/quran.svg";
  static const String ic_hadeeth = "assets/images/hadeeth.svg";
  static const String ic_sebha = "assets/images/sebha.svg";
  static const String ic_radio = "assets/images/radio.svg";
  static const String ic_stats = "assets/images/stats.svg";
  static const String Ismamic_logo = 'assets/images/logo.png';
  static const String ic_chapter = "assets/images/ic_chapter.svg";
  static const String chapterDetailsBackground =
      'assets/images/chaoter_details_background.png';
  static const String splashScreenBackground =
      "assets/images/Splash Screen.png";
  static const String splashLogo = 'assets/images/Splash_logo.png';
  static const String routeLogo = 'assets/images/route_logo.png';
  static const String onboarding_1 = 'assets/images/onboarding_1.png';
  static const String onboarding_2 = 'assets/images/onboarding_2.png';
  static const String onboarding_3 = 'assets/images/onboarding_3.png';
  static const String onboarding_4 = 'assets/images/onboarding_4.png';
  static const String onboarding_5 = 'assets/images/onboarding_5.png';

  static const String Defult_backgroundImage = 'assets/images/Background.jpg';
  static const String onboarding_logo = 'assets/images/onboarding_logo.png';
}

class AppThemes {
  static var darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.gold),
    ),

    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 16,
        color: AppColors.gold,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: AppColors.gold,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.gold,
      selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 36),
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.gold),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
