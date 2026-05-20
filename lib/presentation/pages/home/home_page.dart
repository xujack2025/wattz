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

  double _cardAlpha = 0.4;
  double _cardBorderAlpha = 0.2;

  double _glassAlpha = 0.4;
  double _glassBorderAlpha = 0.2;
  double _glassShadowAlpha = 0.1;

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("Data reloaded!");
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      setState(() {
        blurValue = (offset / 10).clamp(0, 50);
        final t = (offset / 200).clamp(0.0, 0.5);

        _cardAlpha = 0.4 + (0.6 * t);
        _cardBorderAlpha = 0.2 + (0.3 * t);

        _glassAlpha = 0.4 + (0.6 * t);
        _glassBorderAlpha = 0.2 + (0.3 * t);
        _glassShadowAlpha = 0.1 + (0.15 * t);
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
                    AppColors.deepDarkBlue.withValues(alpha: (100 - blurValue) / 100),
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

            // Main Content
            ListView(
              controller: _scrollController,
              children: [
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
                              backgroundAlpha: _glassAlpha,
                              borderAlpha: _glassBorderAlpha,
                              shadowAlpha: _glassShadowAlpha,
                              child: Icon(
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
                        backgroundAlpha: _cardAlpha,
                        borderAlpha: _cardBorderAlpha,
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
                              backgroundAlpha: _cardAlpha,
                              borderAlpha: _cardBorderAlpha,
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
                              backgroundAlpha: _cardAlpha,
                              borderAlpha: _cardBorderAlpha,
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
                            icon: CupertinoIcons.bolt,
                            glassAlpha: _glassAlpha,
                            glassBorderAlpha: _glassBorderAlpha,
                            glassShadowAlpha: _glassShadowAlpha,
                          ),
                          CustomButtonIcon(
                            text: 'AutoCharge',
                            width: 81,
                            icon: CupertinoIcons.bolt_badge_a,
                            glassAlpha: _glassAlpha,
                            glassBorderAlpha: _glassBorderAlpha,
                            glassShadowAlpha: _glassShadowAlpha,
                          ),
                          CustomButtonIcon(
                            text: 'Offline',
                            width: 81,
                            icon: CupertinoIcons.clear_circled,
                            glassAlpha: _glassAlpha,
                            glassBorderAlpha: _glassBorderAlpha,
                            glassShadowAlpha: _glassShadowAlpha,
                          ),
                          CustomButtonIcon(
                            text: 'NewSites',
                            width: 81,
                            icon: CupertinoIcons.location,
                            glassAlpha: _glassAlpha,
                            glassBorderAlpha: _glassBorderAlpha,
                            glassShadowAlpha: _glassShadowAlpha,
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
                            icon: CupertinoIcons.ticket,
                            glassAlpha: _glassAlpha,
                            glassBorderAlpha: _glassBorderAlpha,
                            glassShadowAlpha: _glassShadowAlpha,
                          ),
                          CustomButtonIcon(
                            text: 'Subscriptions',
                            width: 81,
                            icon: CupertinoIcons.creditcard,
                            glassAlpha: _glassAlpha,
                            glassBorderAlpha: _glassBorderAlpha,
                            glassShadowAlpha: _glassShadowAlpha,
                          ),
                          CustomButtonIcon(
                            text: 'Referal',
                            width: 81,
                            icon: CupertinoIcons.person_2,
                            glassAlpha: _glassAlpha,
                            glassBorderAlpha: _glassBorderAlpha,
                            glassShadowAlpha: _glassShadowAlpha,
                          ),
                          CustomButtonIcon(
                            text: 'Go for\nBusiness',
                            width: 81,
                            icon: CupertinoIcons.briefcase,
                            glassAlpha: _glassAlpha,
                            glassBorderAlpha: _glassBorderAlpha,
                            glassShadowAlpha: _glassShadowAlpha,
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
