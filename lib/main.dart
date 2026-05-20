// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'core/utils/app_routes.dart';
import 'presentation/pages/onboarding/onboarding_page.dart';
import 'presentation/widgets/navigation_bar/custom_bottom_nav_bar.dart';
import 'presentation/widgets/text_field/text_example.dart';

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
      home: const CustomBottomNavBar(),
      routes: {
        AppRoutes.homePage: (context) => const CustomBottomNavBar(),
        AppRoutes.onBoardingPage: (context) => const OnBoardingPage(),
      },
    );
  }
}
