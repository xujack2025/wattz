import 'dart:io';

import 'package:cupertino_native/cupertino_native.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../pages/home/home_page.dart';
import '../../pages/map/map_page.dart';
import '../../pages/profile/profile_page.dart';
import '../../pages/reward/reward_page.dart';
import '../../pages/scan/scan_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final appPages = const [
    HomePage(),
    MapPage(),
    ScanPage(),
    RewardPage(),
    ProfilePage(),
  ];

  int selectedTabIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(
        body: appPages[selectedTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: onItemTapped,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              label: "Wattz",
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            ),
            const BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_map_regular),
              label: "Map",
              activeIcon: Icon(FluentSystemIcons.ic_fluent_map_filled),
            ),
            const BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(
                  FluentSystemIcons.ic_fluent_qr_code_regular,
                  size: 38,
                ),
              ),
              label: "",
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(
                  FluentSystemIcons.ic_fluent_qr_code_filled,
                  size: 38,
                ),
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_gift_regular),
              label: "Rewards",
              activeIcon: Icon(FluentSystemIcons.ic_fluent_gift_filled),
            ),
            const BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_accounts_regular),
              label: "Me",
              activeIcon: Icon(
                FluentSystemIcons.ic_fluent_person_accounts_filled,
              ),
            ),
          ],
        ),
      );
    } else if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: Stack(
          children: [
            IndexedStack(index: selectedTabIndex, children: appPages),
            Align(
              alignment: Alignment.bottomCenter,
              child: CNTabBar(
                items: [
                  const CNTabBarItem(
                    icon: CNSymbol("house.fill"),
                    label: "Wattz",
                  ),
                  const CNTabBarItem(icon: CNSymbol("map.fill"), label: "Map"),

                  const CNTabBarItem(icon: CNSymbol("qrcode.viewfinder")),
                  const CNTabBarItem(
                    icon: CNSymbol("gift.fill"),
                    label: "Rewards",
                  ),
                  const CNTabBarItem(
                    icon: CNSymbol("person.fill"),
                    label: "Me",
                  ),
                ],
                currentIndex: selectedTabIndex,
                tint: const Color(0xFF1EBAE0),
                onTap: onItemTapped,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
