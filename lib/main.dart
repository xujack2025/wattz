// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:wattz/core/constants/app_colors.dart';
import 'package:wattz/presentation/pages/onboarding/onboarding_page.dart';
import 'package:wattz/presentation/widgets/navigation_bar/custom_bottom_nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
      ),
      // home: const CustomBottomNavBar(),
      home: const OnBoardingPage(),
    );
  }
}
