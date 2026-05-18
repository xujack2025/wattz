import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_media.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../widgets/card/nearby_station_detail_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("Data reloaded!");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: 60,
      displacement: 0,
      onRefresh: _handleRefresh,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        // appBar: AppBar(),
        body: Stack(
          children: [
            // Background Image
            Container(
              padding: EdgeInsets.only(left: 8, top: 40),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: AppColors.primary,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1],
                  colors: [AppColors.primary, AppColors.bgColor.withValues(alpha: 0.8)],
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
            ListView(
              children: [
                // Content
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.3],
                      colors: [
                        AppColors.bgColor.withValues(alpha: 0),
                        AppColors.bgColor.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                  // padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Notification
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(20), // Glass tint
                                ),
                                child: Icon(
                                  CupertinoIcons.bell_fill,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Merchant Charger Quick Access Card
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: StationDetailCard(
                          logoUrl:
                              'https://play-lh.googleusercontent.com/BkSW_w9u43LTSw-mulSssIO4LRyvLUJntS2nrhcMmItDQ45LJUhfD2pqXovTHJWr7f0I=w240-h480-rw',
                          name: 'ChargeSini',
                          address: '[PUBLIC] FORTUNE CENTRA \n(COMMERCIAL) (Commercial)',
                          powerOutput: 50,
                          distanceInMeters: 211,
                          rating: 4.0,
                          chargerType: 'DC',
                          chargers: 2,
                          buttonRow: CustomButtonRow(
                            buttonRow: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.transparent,
                                    // minimumSize: Size(160, 40),
                                    side: BorderSide(color: AppColors.primary),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Scan QR",
                                    style: AppTextStyles.labelLarge.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    // minimumSize: Size(160, 40),
                                    foregroundColor: AppColors.white,
                                    backgroundColor: AppColors.primary,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "View Chargers",
                                    style: AppTextStyles.labelLarge.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SingleChildScrollView(
                        padding: EdgeInsets.only(left: 16),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StationDetailCard(
                              name: 'ChargeSini',
                              address: 'Kiara Bay',
                              powerOutput: 50,
                              distanceInMeters: 451,
                              chargerType: 'DC',
                              chargers: 3,
                            ),

                            SizedBox(width: 12),
                            StationDetailCard(
                              name: 'ChargeSini',
                              address: 'Kiara Bay',
                              powerOutput: 50,
                              distanceInMeters: 451,
                              chargerType: 'DC',
                              chargers: 3,
                            ),

                            SizedBox(width: 12),
                            StationDetailCard(
                              name: 'ChargeSini',
                              address: 'Kiara Bay',
                              powerOutput: 50,
                              distanceInMeters: 451,
                              chargerType: 'DC',
                              chargers: 3,
                            ),

                            SizedBox(width: 12),
                            StationDetailCard(
                              name: 'ChargeSini',
                              address: 'Kiara Bay',
                              powerOutput: 50,
                              distanceInMeters: 451,
                              chargerType: 'DC',
                              chargers: 3,
                            ),

                            SizedBox(width: 12),
                            StationDetailCard(
                              name: 'ChargeSini',
                              address: 'Kiara Bay',
                              powerOutput: 50,
                              distanceInMeters: 451,
                              chargerType: 'DC',
                              chargers: 3,
                            ),

                            SizedBox(width: 12),
                            StationDetailCard(
                              name: 'ChargeSini',
                              address: 'Kiara Bay',
                              powerOutput: 50,
                              distanceInMeters: 451,
                              chargerType: 'DC',
                              chargers: 3,
                            ),

                            SizedBox(width: 16),
                          ],
                        ),
                      ),
                      SizedBox(height: 300),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
