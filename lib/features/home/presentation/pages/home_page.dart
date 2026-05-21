import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_media.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/button/title_text_button.dart';
import '../../../../core/widgets/container/image_container.dart';
import '../../../charger/presentation/bloc/station_bloc.dart';
import '../../../charger/presentation/widgets/station_image_card.dart';
import '../widgets/home_background_container.dart';
import '../widgets/home_header_quick_access_card.dart';
import '../widgets/home_notification.dart';
import '../widgets/home_quick_access_card.dart';
import '../widgets/home_quick_action_grid_view.dart';
import '../widgets/home_station_shop_list.dart';

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
      onRefresh: () async {
        context.read<StationBloc>().add(StationsRequested());
        Future.delayed(Duration(seconds: 1));
        debugPrint("Data reloaded!");
      },
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Stack(
          children: [
            // Container Background
            HomeBackgroundContainer(blurValue: blurValue),

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
                    HomeNotification(
                      glassAlpha: _glassAlpha,
                      glassBorderAlpha: _glassBorderAlpha,
                      glassShadowAlpha: _glassShadowAlpha,
                    ),

                    // Station Charger Quick Access Card
                    const SizedBox(height: 20),
                    HomeHeaderQuickAccessCard(
                      cardAlpha: _cardAlpha,
                      cardBorderAlpha: _cardBorderAlpha,
                    ),

                    // Station List
                    const SizedBox(height: 30),
                    HomeQuickAccessCard(
                      cardAlpha: _cardAlpha,
                      cardBorderAlpha: _cardBorderAlpha,
                    ),

                    // First Row Icon Button
                    const SizedBox(height: 30),
                    HomeQuickActionGridView(
                      glassAlpha: _glassAlpha,
                      glassBorderAlpha: _glassBorderAlpha,
                      glassShadowAlpha: _glassShadowAlpha,
                    ),

                    // New Poster
                    const SizedBox(height: 30),
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 16),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++) ...[
                            ImageContainer(image: "https://placehold.co/250x150.png"),
                            (i < 5)
                                ? const SizedBox(width: 14)
                                : const SizedBox(width: 16),
                          ],
                        ],
                      ),
                    ),

                    // Shopping Station List
                    const SizedBox(height: 30),
                    HomeStationShopList(),

                    // On The Road Header
                    const SizedBox(height: 30),
                    const TitleTextButton(text: "While On The Road"),

                    // On The Road Station List
                    const SizedBox(height: 6),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++) ...[
                            StationImageCard(
                              stationName: "Petronas Penchana link",
                              stationInfo: "6.3 km · Kuala Lumpur",
                              stationImageUrl: "https://placehold.co/250x150.png",
                              stationLogo: AppMedia.logoUrl,
                              connectors: const [ConnectorDisplay(type: "DC", count: 3)],
                            ),
                            (i < 4)
                                ? const SizedBox(width: 14)
                                : const SizedBox(width: 16),
                          ],
                        ],
                      ),
                    ),

                    /// Bottom Safe Area
                    SizedBox(height: 70),
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
