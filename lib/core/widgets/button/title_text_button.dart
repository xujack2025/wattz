import 'package:flutter/cupertino.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class TitleTextButton extends StatelessWidget {
  const TitleTextButton({
    super.key,
    required this.text,
    this.textColor = AppColors.primary,
    this.onTap,
    this.iconSize = 18,
    this.buttonIcon = true,
  });
  final String text;
  final Color textColor;
  final double iconSize;
  final VoidCallback? onTap;
  final bool buttonIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              text,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.darkGrey,
              ),
            ),
          ),
          const SizedBox(width: 4),
          buttonIcon
              ? Icon(CupertinoIcons.chevron_right, size: iconSize, color: textColor)
              : SizedBox(),
        ],
      ),
    );
  }
}
