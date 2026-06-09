import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/widgets/button/custom_filled_button.dart';
import '../../../../core/widgets/button/custom_outline_button.dart';
import '../../../charger/presentation/bloc/station_bloc.dart';
import '../../../charger/presentation/widgets/nearby_station_detail_card.dart';
import '../pages/home_page.dart';

class HomeHeaderQuickAccessCard extends StatelessWidget {
  const HomeHeaderQuickAccessCard({
    super.key,
    required double cardAlpha,
    required double cardBorderAlpha,
  }) : _cardAlpha = cardAlpha,
       _cardBorderAlpha = cardBorderAlpha;

  final double _cardAlpha;
  final double _cardBorderAlpha;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StationBloc, StationState>(
      builder: (context, state) {
        if (state is StationsLoaded) {
          final stations = state.stations;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StationDetailCard(
              isCompact: false,
              backgroundAlpha: _cardAlpha,
              borderAlpha: _cardBorderAlpha,
              logoUrl: AppMedia.logoUrl,
              name: stations[0].operatorName,
              address: stations[0].name,
              widgetRow: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOutlineButton(text: "Scan QR", onTap: () {}),
                  const SizedBox(width: 16),
                  CustomFilledButton(text: "View Chargers", onTap: () {}),
                ],
              ),
              powerOutput: stations[0].maxPower,
              distanceInMeters: formatDistance(stations[0].distance),
              rating: 4.0,
              borderRadius: BorderRadius.circular(20),
              connectors: connectorDisplaysForStation(stations[0]),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
