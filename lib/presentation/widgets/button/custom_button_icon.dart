import 'package:flutter/material.dart';

import '../../../core/constants/app_text_styles.dart';
import '../glass_effect/custom_glass_container.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    super.key,
    required this.text,
    required this.icon,
    this.textAlign = TextAlign.center,
    this.textStyle,
    this.iconColor = Colors.black,
    this.width = 60.0,
    this.glassAlpha = 0.12,
    this.glassBorderAlpha = 0.2,
    this.glassShadowAlpha = 0.1,
  });

  final String text;
  final IconData icon;
  final TextAlign textAlign; 
  final TextStyle? textStyle;
  final Color iconColor;
  final double width; 
  final double glassAlpha;
  final double glassBorderAlpha;
  final double glassShadowAlpha;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          CustomGlassContainer(
            sigmaX: 0,
            sigmaY: 0,
            padding: 16,
            backgroundAlpha: glassAlpha,
            borderAlpha: glassBorderAlpha,
            shadowAlpha: glassShadowAlpha,
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(height: 4),
          Text(
            text,
            textAlign: textAlign,
            style: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
