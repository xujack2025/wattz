import 'package:flutter/material.dart';

import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/container/image_container.dart';
import 'connector_type_container.dart';

class StationImageCard extends StatelessWidget {
  const StationImageCard({
    super.key,
    required this.stationName,
    required this.stationInfo,
    required this.stationImageUrl,
    required this.stationLogo,
    required this.connectors,
    this.borderRadius = 5,
  });

  final String stationName;
  final String stationInfo;
  final String stationImageUrl;
  final String stationLogo;
  final List<ConnectorDisplay> connectors;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageContainer(image: stationImageUrl),
        const SizedBox(height: 6),
        Text(stationName, overflow: TextOverflow.clip, maxLines: 1),
        const SizedBox(height: 2),
        Text(stationInfo),
        const SizedBox(height: 2),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(stationLogo),
                ),
              ),
            ),
            const SizedBox(width: 8),
            for (int i = 0; i < connectors.length; i++) ...[
              ConnectorTypeContainer(
                connectorType: connectors[i].type,
                chargerIndex: connectors[i].count,
                borderRadius: borderRadius,
                indexStyle: AppTextStyles.labelSmall,
                connectorStyle: AppTextStyles.labelSmall.copyWith(fontSize: 9),
              ),
              if (i < connectors.length - 1) const SizedBox(width: 6),
            ],
          ],
        ),
      ],
    );
  }
}

class ConnectorDisplay {
  const ConnectorDisplay({required this.type, required this.count});

  final String type;
  final int count;
}
