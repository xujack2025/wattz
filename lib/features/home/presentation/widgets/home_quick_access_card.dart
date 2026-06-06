import 'package:flutter/material.dart';

import '../../../../core/constants/constant.dart';
import '../../../charger/presentation/widgets/nearby_station_detail_card.dart';

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
              address: 'Kiara Bay by Master Card',
              chargerType: 'DC',
              chargers: 3,
              distanceInMeters: 211,
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
              address: '[PUBLIC] FORTUNE CENTRA (COMMERCIAL) (Commercial)',
              chargerType: 'DC',
              chargers: 3,
              distanceInMeters: 211,
            ),
          ),
        ],
      ),
    );
  }
}
