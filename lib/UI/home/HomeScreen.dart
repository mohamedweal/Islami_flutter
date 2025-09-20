import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islami/UI/Common/AppScreenWrapper.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/home/hadeth/HadethContent.dart';
import 'package:islami/UI/home/prayer/PrayerContent.dart';
import 'package:islami/UI/home/quran/QuranContent.dart';
import 'package:islami/UI/home/radio/RadioContent.dart';
import 'package:islami/UI/home/sebha/SebhaContent.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScreenWrapper(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                AppImages.Ismamic_logo,
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: tabs[selectedTabIndex],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },

          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_Quran),
                width: 24,
                height: 24,
              ),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_hadeeth),
                width: 24,
                height: 24,
              ),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_sebha),
                width: 24,
                height: 24,
              ),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_radio),
                width: 24,
                height: 24,
              ),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_stats),
                width: 24,
                height: 24,
              ),
              label: 'Prayer',
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> tabs = [
  QuranContent(),
  HadethContent(),
  SebhaContent(),
  RadioContent(),
  PrayerContent(),
];
