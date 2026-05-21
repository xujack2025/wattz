import 'package:flutter/material.dart';

import '../../../../core/constants/app_media.dart';
import '../../../../core/widgets/button/custom_filled_button.dart';
import '../../../../core/widgets/button/custom_outline_button.dart';
import '../../../charger/presentation/widgets/nearby_station_detail_card.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: StationDetailCard(
        isCompact: false,
        backgroundAlpha: _cardAlpha,
        borderAlpha: _cardBorderAlpha,
        logoUrl: AppMedia.logoUrl,
        name: 'ChargeSini',
        address: '[PUBLIC] FORTUNE CENTRA \n(COMMERCIAL) (Commercial)',
        chargerType: 'DC',
        chargers: 2,
        widgetRow: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomOutlineButton(text: "Scan QR", onTap: () {}),
            const SizedBox(width: 16),
            CustomFilledButton(text: "View Chargers", onTap: () {}),
          ],
        ),
        powerOutput: 50,
        distanceInMeters: 451,
        rating: 4.0,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
