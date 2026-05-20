import 'package:flutter/material.dart';

import '../../../core/constants/app_text_styles.dart';
import '../connector_type_container.dart';
import '../image_container.dart';

class StationImageCard extends StatelessWidget {
  const StationImageCard({
    super.key,
    required this.stationName,
    required this.stationInfo,
    required this.stationImageUrl,
    required this.stationLogo,
    required this.connectorType,
    required this.chargerIndex,
    this.borderRadius = 5,
  });

  final String stationName;
  final String stationInfo;
  final String stationImageUrl;
  final String stationLogo;
  final String connectorType;
  final int chargerIndex;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageContainer(image: stationImageUrl),
        const SizedBox(height: 6),
        Text(stationName),
        const SizedBox(height: 2),
        Text(stationInfo),
        const SizedBox(height: 2),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://play-lh.googleusercontent.com/BkSW_w9u43LTSw-mulSssIO4LRyvLUJntS2nrhcMmItDQ45LJUhfD2pqXovTHJWr7f0I=w240-h480-rw",
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ConnectorTypeContainer(
              connectorType: connectorType,
              chargerIndex: chargerIndex,
              borderRadius: borderRadius,
              indexStyle: AppTextStyles.labelSmall,
              connectorStyle: AppTextStyles.labelSmall.copyWith(fontSize: 9),
            ),
            const SizedBox(width: 6),
            ConnectorTypeContainer(
              connectorType: "AC",
              chargerIndex: 1,
              borderRadius: borderRadius,
              indexStyle: AppTextStyles.labelSmall,
              connectorStyle: AppTextStyles.labelSmall.copyWith(fontSize: 9),
            ),
          ],
        ),
      ],
    );
  }
}
