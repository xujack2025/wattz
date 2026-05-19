import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_media.dart';
import '../../widgets/button/custom_button_icon.dart';
import '../../widgets/button/custom_filled_button.dart';
import '../../widgets/button/custom_outline_button.dart';
import '../../widgets/card/nearby_station_detail_card.dart';
import '../../widgets/glass_effect/custom_glass_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  double blurValue = 0;

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("Data reloaded!");
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      setState(() {
        blurValue = (offset / 20).clamp(0, 20);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: 60,
      displacement: 0,
      onRefresh: _handleRefresh,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Stack(
          children: [
            // Container Background
            Container(
              padding: EdgeInsets.only(left: 8, top: 40),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 1],
                  colors: [
                    AppColors.deepDarkBlue,
                    AppColors.bgColor.withValues(alpha: 0.8),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    AppMedia.ezchargeIcon,
                    fit: BoxFit.fitWidth,
                    scale: 5,
                    // color: Colors.transparent,
                  ),
                ],
              ),
            ),

            // Blur Layer
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                ),
              ),
            ),

            ListView(
              controller: _scrollController,
              children: [
                // Content
                Column(
                  children: [
                    // Notification
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 16),
                          child: ClipOval(
                            child: CustomGlassContainer(
                              padding: 12,
                              widget: Icon(
                                CupertinoIcons.bell_fill,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Station Charger Quick Access Card
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: StationDetailCard(
                        isCompact: false,
                        logoUrl:
                            'https://play-lh.googleusercontent.com/BkSW_w9u43LTSw-mulSssIO4LRyvLUJntS2nrhcMmItDQ45LJUhfD2pqXovTHJWr7f0I=w240-h480-rw',
                        name: 'ChargeSini',
                        address: '[PUBLIC] FORTUNE CENTRA \n(COMMERCIAL) (Commercial)',
                        chargerType: 'DC',
                        chargers: 2,
                        widgetRow: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlineButton(text: "Scan QR", onTap: () {}),
                            SizedBox(width: 16),
                            CustomFilledButton(text: "View Chargers", onTap: () {}),
                          ],
                        ),
                        powerOutput: 50,
                        distanceInMeters: 451,
                        rating: 4.0,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    // Station List
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: StationDetailCard(
                              isCompact: true,
                              borderRadius: BorderRadius.circular(20),
                              logoUrl:
                                  'https://play-lh.googleusercontent.com/BkSW_w9u43LTSw-mulSssIO4LRyvLUJntS2nrhcMmItDQ45LJUhfD2pqXovTHJWr7f0I=w240-h480-rw',
                              address: 'Kiara Bay by Master Card',
                              chargerType: 'DC',
                              chargers: 3,
                              distanceInMeters: 211,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: StationDetailCard(
                              isCompact: true,
                              borderRadius: BorderRadius.circular(20),
                              logoUrl:
                                  'https://play-lh.googleusercontent.com/BkSW_w9u43LTSw-mulSssIO4LRyvLUJntS2nrhcMmItDQ45LJUhfD2pqXovTHJWr7f0I=w240-h480-rw',
                              address:
                                  '[PUBLIC] FORTUNE CENTRA (COMMERCIAL) (Commercial)',
                              chargerType: 'DC',
                              chargers: 3,
                              distanceInMeters: 211,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // First Row Icon Button
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButtonIcon(
                            text: 'DCFC',
                            width: 81,
                            icon: CupertinoIcons.add_circled,
                          ),
                          CustomButtonIcon(
                            text: 'AutoCharge',
                            width: 81,
                            icon: CupertinoIcons.add_circled,
                          ),
                          CustomButtonIcon(
                            text: 'Offline',
                            width: 81,
                            icon: CupertinoIcons.add_circled,
                          ),
                          CustomButtonIcon(
                            text: 'NewSites',
                            width: 81,
                            icon: CupertinoIcons.add_circled,
                          ),
                        ],
                      ),
                    ),

                    // Second Row Icon Button
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButtonIcon(
                            text: 'Promo',
                            width: 81,
                            icon: CupertinoIcons.add_circled,
                          ),
                          CustomButtonIcon(
                            text: 'Subscriptions',
                            width: 81,
                            icon: CupertinoIcons.add_circled,
                          ),
                          CustomButtonIcon(
                            text: 'Referal',
                            width: 81,
                            icon: CupertinoIcons.add_circled,
                          ),
                          CustomButtonIcon(
                            text: 'Go for\nBusiness',
                            width: 81,
                            icon: CupertinoIcons.add_circled,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 3000),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
