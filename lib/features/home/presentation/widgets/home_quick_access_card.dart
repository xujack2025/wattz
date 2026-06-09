import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constant.dart';
import '../../../charger/presentation/bloc/station_bloc.dart';
import '../../../charger/presentation/widgets/nearby_station_detail_card.dart';
import '../pages/home_page.dart';

class HomeQuickAccessCard extends StatelessWidget {
  const HomeQuickAccessCard({
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
            child: Row(
              children: [
                Expanded(
                  child: StationDetailCard(
                    isCompact: true,
                    borderRadius: BorderRadius.circular(20),
                    backgroundAlpha: _cardAlpha,
                    borderAlpha: _cardBorderAlpha,
                    logoUrl: AppMedia.logoUrl,
                    address: stations[1].name,
                    distanceInMeters: formatDistance(stations[1].distance),
                    connectors: connectorDisplaysForStation(stations[1]),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StationDetailCard(
                    isCompact: true,
                    borderRadius: BorderRadius.circular(20),
                    backgroundAlpha: _cardAlpha,
                    borderAlpha: _cardBorderAlpha,
                    logoUrl: AppMedia.logoUrl,
                    address: stations[2].name,
                    distanceInMeters: formatDistance(stations[2].distance),
                    connectors: connectorDisplaysForStation(stations[2]),
                  ),
                ),
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
