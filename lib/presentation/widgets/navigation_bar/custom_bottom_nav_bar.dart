import 'package:cupertino_native/cupertino_native.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wattz/presentation/pages/home/home_page.dart';
import 'package:wattz/presentation/pages/map/map_page.dart';
import 'package:wattz/presentation/pages/profile/profile_page.dart';
import 'package:wattz/presentation/pages/reward/reward_page.dart';
import 'package:wattz/presentation/pages/scan/scan_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int selectedTabIndex = 0;

  final appPages = const [HomePage(), MapPage(), ScanPage(), RewardPage(), ProfilePage()];

  @override
  void initState() {
    tabController = TabController(length: appPages.length, vsync: this);
    tabController.addListener(updateTabIndex);
    super.initState();
  }

  void updateTabIndex() {
    if (tabController.index != selectedTabIndex) {
      setState(() {
        selectedTabIndex = tabController.index;
      });
    }
  }

  void onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
    tabController.animateTo(index);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Positioned.fill(
            child: TabBarView(controller: tabController, children: appPages),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CNTabBar(
              items: [
                CNTabBarItem(icon: CNSymbol("house.fill"), label: "Wattz"),
                CNTabBarItem(icon: CNSymbol("map.fill"), label: "Map"),
                CNTabBarItem(icon: CNSymbol("qrcode.viewfinder")),
                CNTabBarItem(icon: CNSymbol("gift.fill"), label: "Rewards"),
                CNTabBarItem(icon: CNSymbol("person.fill"), label: "Me"),
              ],
              currentIndex: selectedTabIndex,
              tint: Color(0xFF1EBAE0),
              onTap: onTabTap,
            ),
          ),
        ],
      ),
    );
  }
}
