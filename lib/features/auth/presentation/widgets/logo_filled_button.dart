import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class LogoFilledButton extends StatelessWidget {
  const LogoFilledButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.primary,
    this.imagePath,
    this.icon,
    this.imageColor,
    this.iconSize = 24,
    this.imageSize = 24,
  });

  final Color backgroundColor;
  final String text;
  final Color textColor;
  final String? imagePath;
  final Color? imageColor;
  final double? imageSize;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath!,
              width: imageSize,
              height: imageSize,
              color: imageColor,
            ),
          if (icon != null) Icon(icon, color: textColor, size: iconSize),
          SizedBox(width: 4),
          Text(
            text,
            style: AppTextStyles.labelLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
