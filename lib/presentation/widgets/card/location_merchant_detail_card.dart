import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class LocationMerchantDetailCard extends StatelessWidget {
  const LocationMerchantDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          /// Row
          /// Merchant Detials
          Row(
            children: [
              // Icon
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      "https://play-lh.googleusercontent.com/BkSW_w9u43LTSw-mulSssIO4LRyvLUJntS2nrhcMmItDQ45LJUhfD2pqXovTHJWr7f0I=w240-h480-rw",
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),

              // Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Merchant
                  Text("Apple", style: AppTextStyles.labelSmall),
                  // Address
                  Text(
                    "[PUBLIC] FORTUNE CENTRA \n(COMMERCIAL) (Commercial)",
                    style: AppTextStyles.titleMedium,
                  ),
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
                "50kW max  ·  211m  ·  ⭐️ 0.0",
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
                    "DC",
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
                "2",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(160, 40),
                  side: BorderSide(color: AppColors.primary),
                ),
                onPressed: () {},
                child: Text("Scan QR"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(160, 40),
                  foregroundColor: AppColors.white,
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () {},
                child: Text("View Chargers"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
