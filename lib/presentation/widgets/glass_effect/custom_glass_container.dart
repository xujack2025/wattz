import 'dart:ui';

import 'package:flutter/material.dart';

class CustomGlassContainer extends StatelessWidget {
  const CustomGlassContainer({
    super.key,
    this.sigmaX = 12,
    this.sigmaY = 12,
    this.shape = BoxShape.circle,
    required this.widget,
    this.padding = 0,
  });

  final double? sigmaX;
  final double? sigmaY;
  final double? padding;
  final BoxShape? shape;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX!, sigmaY: sigmaY!),
      child: Container(
        padding: EdgeInsets.all(padding!),
        decoration: BoxDecoration(
          shape: shape!,
          color: Colors.white.withValues(alpha: 0.12),
          border: Border.all(width: 1, color: Colors.white.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: widget,
      ),
    );
  }
}
