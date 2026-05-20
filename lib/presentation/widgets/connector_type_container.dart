import 'package:flutter/cupertino.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class ConnectorTypeContainer extends StatelessWidget {
  const ConnectorTypeContainer({
    super.key,
    required this.connectorType,
    required this.chargerIndex,
    required this.borderRadius,
    this.connectorStyle = AppTextStyles.labelLarge,
    this.indexStyle = AppTextStyles.labelLarge,
    this.textColor = AppColors.primary,
    this.fontWeight = FontWeight.bold,
  });

  final String connectorType;
  final int chargerIndex;
  final double borderRadius;
  final TextStyle? connectorStyle;
  final TextStyle? indexStyle;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
          decoration: BoxDecoration(
            border: BoxBorder.all(
              width: 1,
              style: BorderStyle.solid,
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Text(
            textAlign: TextAlign.center,
            connectorType,
            style: connectorStyle!.copyWith(
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
        // Quantity
        const SizedBox(width: 4),
        Text(
          "$chargerIndex",
          style: indexStyle!.copyWith(color: textColor, fontWeight: fontWeight),
        ),
      ],
    );
  }
}
