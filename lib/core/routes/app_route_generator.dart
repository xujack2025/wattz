import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/sign_in_options_page.dart';
import '../../features/auth/presentation/pages/sign_in_with_email_page.dart';
import '../../features/auth/presentation/pages/sign_up_with_email_page.dart';
import '../../features/map/presentation/pages/map_page.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/reward/presentation/pages/reward_page.dart';
import '../../features/scan/presentation/pages/scan_page.dart';
import '../../global.dart';
import '../widgets/navigation_bar/custom_bottom_nav_bar.dart';
import 'app_routes.dart';

class AppRouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingPage:
        final deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        return MaterialPageRoute(
          builder: (_) => deviceFirstOpen
              ? const OnBoardingPage()
              : const SignInOptionsPage(),
        );
      case AppRoutes.onBoardingPreviewPage:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavBar());
      case AppRoutes.mapPage:
        return MaterialPageRoute(builder: (_) => const MapPage());
      case AppRoutes.profilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case AppRoutes.rewardPage:
        return MaterialPageRoute(builder: (_) => const RewardPage());
      case AppRoutes.scanPage:
        return MaterialPageRoute(builder: (_) => const ScanPage());
      case AppRoutes.signInOptionsPage:
        return MaterialPageRoute(
          builder: (_) => const SignInOptionsPage(),
          fullscreenDialog: true,
        );
      case AppRoutes.signInWithEmailPage:
        return MaterialPageRoute(builder: (_) => const SignInWithEmailPage());
      case AppRoutes.signUpWithEmailPage:
        return MaterialPageRoute(builder: (_) => const SignUpWithEmailPage());
      default:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavBar());
    }
  }
}
