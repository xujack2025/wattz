import 'package:flutter/cupertino.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/container/custom_glass_container.dart';

class HomeNotification extends StatelessWidget {
  const HomeNotification({
    super.key,
    required double glassAlpha,
    required double glassBorderAlpha,
    required double glassShadowAlpha,
  }) : _glassAlpha = glassAlpha,
       _glassBorderAlpha = glassBorderAlpha,
       _glassShadowAlpha = glassShadowAlpha;

  final double _glassAlpha;
  final double _glassBorderAlpha;
  final double _glassShadowAlpha;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 16),
          child: ClipOval(
            child: CustomGlassContainer(
              padding: 10,
              backgroundAlpha: _glassAlpha,
              borderAlpha: _glassBorderAlpha,
              shadowAlpha: _glassShadowAlpha,
              child: const Icon(
                CupertinoIcons.bell_fill,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
