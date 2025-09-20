import 'package:flutter/material.dart';
import 'package:islami/UI/routes.dart';

import 'design.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showFirstSplash = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() {
        showFirstSplash = false;
      });

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.HomeScreen.route);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        child: showFirstSplash ? _buildFirstSplash() : _buildSecondSplash(),
      ),
    );
  }

  Widget _buildFirstSplash() {
    return Container(
      key: const ValueKey(1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.splashScreenBackground),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSecondSplash() {
    return Container(
      key: const ValueKey(2),
      color: Color(0xFF212121),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(child: Image.asset(AppImages.splashLogo, width: 345)),
          Positioned(
            bottom: 50,
            child: Image.asset(AppImages.routeLogo, width: 245),
          ),
        ],
      ),
    );
  }
}
