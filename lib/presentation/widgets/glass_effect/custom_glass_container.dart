import 'dart:ui';

import 'package:flutter/material.dart';

class CustomGlassContainer extends StatelessWidget {
  const CustomGlassContainer({
    super.key,
    required this.child,
    this.padding = 0.0,
    this.shape = BoxShape.circle,
    this.sigmaX = 12.0,
    this.sigmaY = 12.0,
    this.backgroundAlpha = 0.4,
    this.borderAlpha = 0.2,
    this.shadowAlpha = 0.1,
  });

  final Widget child;
  final double padding;
  final BoxShape shape;
  final double sigmaX;
  final double sigmaY;
  final double backgroundAlpha;
  final double borderAlpha;
  final double shadowAlpha;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          shape: shape,
          color: Colors.white.withValues(alpha: backgroundAlpha),
          border: Border.all(
            width: 1,
            color: Colors.white.withValues(alpha: borderAlpha),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: shadowAlpha),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
