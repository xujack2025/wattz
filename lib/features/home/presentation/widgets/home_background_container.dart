import 'package:flutter/material.dart';

import '../../../../core/constants/app_media.dart';
import '../../../../core/themes/app_colors.dart';

class HomeBackgroundContainer extends StatelessWidget {
  const HomeBackgroundContainer({super.key, required this.blurValue});

  final double blurValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 40),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 1],
          colors: [
            AppColors.primary.withValues(alpha: (100 - blurValue) / 100),
            AppColors.bgColor.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: Stack(
        children: [Image.asset(AppMedia.ezchargeIcon, fit: BoxFit.fitWidth, scale: 5)],
      ),
    );
  }
}
