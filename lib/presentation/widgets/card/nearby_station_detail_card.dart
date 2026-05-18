import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class StationDetailCard extends StatelessWidget {
  const StationDetailCard({
    super.key,
    this.logoUrl,
    required this.name,
    required this.address,
    required this.powerOutput,
    required this.distanceInMeters,
    this.rating,
    required this.chargerType,
    required this.chargers,
    this.buttonRow,
    this.cardWidth,
  });

  final String? logoUrl;
  final String name;
  final String address;
  final double powerOutput;
  final double distanceInMeters;
  final double? rating;
  final String chargerType;
  final int chargers;
  final Widget? buttonRow;
  final double? cardWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      // height: 200,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
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
                  Text(name, style: AppTextStyles.labelSmall),
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
                "$powerOutput kW max  ·  $distanceInMeters m  ·  ⭐️ $rating",
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
          if (buttonRow != null) ...[buttonRow!],

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         elevation: 0,
          //         backgroundColor: Colors.transparent,
          //         minimumSize: Size(160, 40),
          //         side: BorderSide(color: AppColors.primary),
          //       ),
          //       onPressed: onTap,
          //       child: Text(
          //         "Scan QR",
          //         style: AppTextStyles.labelLarge.copyWith(fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         elevation: 0,
          //         minimumSize: Size(160, 40),
          //         foregroundColor: AppColors.white,
          //         backgroundColor: AppColors.primary,
          //       ),
          //       onPressed: onTap,
          //       child: Text(
          //         "View Chargers",
          //         style: AppTextStyles.labelLarge.copyWith(fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class CustomButtonRow extends StatelessWidget {
  const CustomButtonRow({super.key, required this.buttonRow});

  final List<Widget> buttonRow;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: buttonRow);
  }
}
