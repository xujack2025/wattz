import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/button/custom_button_icon.dart';

class HomeQuickActionGridView extends StatelessWidget {
  const HomeQuickActionGridView({
    super.key,
    required this.glassAlpha,
    required this.glassBorderAlpha,
    required this.glassShadowAlpha,
    this.width = 82,
  });

  final double width;
  final double glassAlpha;
  final double glassBorderAlpha;
  final double glassShadowAlpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        crossAxisSpacing: 15,
        shrinkWrap: true,
        childAspectRatio: 0.8,
        children: [
          CustomButtonIcon(
            text: 'DCFC',
            width: width,
            icon: CupertinoIcons.bolt,
            glassAlpha: glassAlpha,
            glassBorderAlpha: glassBorderAlpha,
            glassShadowAlpha: glassShadowAlpha,
          ),
          CustomButtonIcon(
            text: 'AutoCharge',
            width: width,
            icon: CupertinoIcons.bolt_badge_a,
            glassAlpha: glassAlpha,
            glassBorderAlpha: glassBorderAlpha,
            glassShadowAlpha: glassShadowAlpha,
          ),
          CustomButtonIcon(
            text: 'Offline',
            width: width,
            icon: CupertinoIcons.clear_circled,
            glassAlpha: glassAlpha,
            glassBorderAlpha: glassBorderAlpha,
            glassShadowAlpha: glassShadowAlpha,
          ),
          CustomButtonIcon(
            text: 'NewSites',
            width: width,
            icon: CupertinoIcons.location,
            glassAlpha: glassAlpha,
            glassBorderAlpha: glassBorderAlpha,
            glassShadowAlpha: glassShadowAlpha,
          ),
          CustomButtonIcon(
            text: 'Promo',
            width: width,
            icon: CupertinoIcons.ticket,
            glassAlpha: glassAlpha,
            glassBorderAlpha: glassBorderAlpha,
            glassShadowAlpha: glassShadowAlpha,
          ),
          CustomButtonIcon(
            text: 'Subscriptions',
            width: width,
            icon: CupertinoIcons.creditcard,
            glassAlpha: glassAlpha,
            glassBorderAlpha: glassBorderAlpha,
            glassShadowAlpha: glassShadowAlpha,
          ),
          CustomButtonIcon(
            text: 'Referal',
            width: width,
            icon: CupertinoIcons.person_2,
            glassAlpha: glassAlpha,
            glassBorderAlpha: glassBorderAlpha,
            glassShadowAlpha: glassShadowAlpha,
          ),
          CustomButtonIcon(
            text: 'Go for\nBusiness',
            width: width,
            icon: CupertinoIcons.briefcase,
            glassAlpha: glassAlpha,
            glassBorderAlpha: glassBorderAlpha,
            glassShadowAlpha: glassShadowAlpha,
          ),
        ],
      ),
    );
  }
}
