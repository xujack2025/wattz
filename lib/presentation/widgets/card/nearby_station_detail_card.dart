import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class StationDetailCard extends StatelessWidget {
  const StationDetailCard({
    super.key,
    required this.address,
    required this.chargerType,
    required this.chargers,
    required this.isCompact,
    required this.borderRadius,
    this.logoUrl,
    this.name,
    this.powerOutput,
    this.distanceInMeters,
    this.rating,
    this.widgetRow,
    this.cardWidth,
    this.backgroundAlpha = 0.4,
    this.borderAlpha = 0.2,
  });

  final String address;
  final String chargerType;
  final int chargers;
  final String? logoUrl;
  final String? name;
  final double? powerOutput;
  final double? distanceInMeters;
  final double? rating;
  final Widget? widgetRow;

  // UI Configuration & Styles (UI 布局与样式配置)
  final bool isCompact;
  final double? cardWidth;
  final BorderRadius borderRadius;
  final double backgroundAlpha;
  final double borderAlpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: backgroundAlpha),
        border: Border.all(
          color: AppColors.white.withValues(alpha: borderAlpha),
          width: 1,
        ),
        borderRadius: borderRadius,
      ),
      child: isCompact ? _buildCompactCard() : _buildFullCard(),
    );
  }

  Widget _buildFullCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Row
        /// Merchant Detials
        Row(
          children: [
            // Icon
            if (logoUrl != null) ...[
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(logoUrl!),
                  ),
                ),
              ),
              SizedBox(width: 8),
            ],

            // Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Merchant
                if (name != null) ...[Text(name!, style: AppTextStyles.labelSmall)],
                // Address
                Text(address, style: AppTextStyles.titleMedium),
              ],
            ),
          ],
        ),

        /// Row
        /// Charging Station Details
        SizedBox(height: 8),
        Row(
          children: [
            // Details
            Text(
              "$powerOutput kW max  ·  ${distanceInMeters!.toInt()} m  ·  ⭐️ $rating",
              style: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),

        /// Current Type
        SizedBox(height: 6),
        Row(
          children: [
            Container(
              height: 24,
              width: 30,
              // padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  chargerType,
                  style: AppTextStyles.labelLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            // Quantity
            SizedBox(width: 4),
            Text(
              chargers.toString(),
              style: AppTextStyles.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),

        /// Row
        /// Button
        SizedBox(height: 6),
        if (widgetRow != null) ...[widgetRow!],
      ],
    );
  }

  Widget _buildCompactCard() {
    return Column(
      children: [
        // Row with name and logo
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Station Name
            Expanded(
              child: Text(
                address,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            // Station Logo
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(logoUrl!),
                ),
              ),
            ),
          ],
        ),

        // Row charger type, quantity and distance
        SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                // Charger Type Icon
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0.5, 0, 0.5),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: AppColors.primary,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      chargerType,
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                // Quantity
                SizedBox(width: 4),
                Text(
                  chargers.toString(),
                  style: AppTextStyles.labelSmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Text("${distanceInMeters!.toInt()} m", style: AppTextStyles.labelSmall),
          ],
        ),
      ],
    );
  }
}
