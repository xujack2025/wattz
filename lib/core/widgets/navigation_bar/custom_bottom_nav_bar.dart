import 'dart:io';

import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/presentation/bloc/bottom_nav_bloc.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/map/presentation/pages/map_page.dart';
import '../../../features/profile/presentation/pages/profile_page.dart';
import '../../../features/reward/presentation/pages/reward_page.dart';
import '../../../features/scan/presentation/pages/scan_page.dart';
import '../../themes/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  final appPages = const [
    HomePage(),
    MapPage(),
    ScanPage(),
    RewardPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final platformColor = Platform.isIOS ? AppColors.primary : null;
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        if (state is BottomNavSelected) {
          return AdaptiveScaffold(
            minimizeBehavior: TabBarMinimizeBehavior.never,
            body: appPages[state.selectedIndex],
            bottomNavigationBar: AdaptiveBottomNavigationBar(
              selectedIndex: state.selectedIndex,
              onTap: (index) {
                context.read<BottomNavBloc>().add(OnItemTapped(index));
              },
              selectedItemColor: platformColor,
              unselectedItemColor: Colors.grey,
              items: [
                AdaptiveNavigationDestination(
                  icon: Platform.isIOS ? 'house.fill' : Icons.home,
                  label: "Wattz",
                ),
                AdaptiveNavigationDestination(
                  icon: Platform.isIOS ? 'map.fill' : Icons.map,
                  label: "Map",
                ),
                AdaptiveNavigationDestination(
                  icon: Platform.isIOS
                      ? 'qrcode.viewfinder'
                      : Icons.qr_code_scanner,
                  label: "",
                ),
                AdaptiveNavigationDestination(
                  icon: Platform.isIOS ? 'gift.fill' : Icons.card_giftcard,
                  label: "Rewards",
                ),
                AdaptiveNavigationDestination(
                  icon: Platform.isIOS ? 'person.fill' : Icons.person,
                  label: "Me",
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
