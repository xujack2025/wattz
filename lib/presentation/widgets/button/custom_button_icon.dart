import 'package:flutter/material.dart';

import '../../../core/constants/app_text_styles.dart';
import '../glass_effect/custom_glass_container.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.textStyle,
    this.width = 60,
    required this.icon,
    this.iconColor = Colors.black,
  });

  final double? width;
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final IconData icon;
  final Color iconColor;

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
            widget: Icon(icon, color: iconColor),
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
