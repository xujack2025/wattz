import 'package:flutter/material.dart';

abstract class AppTextStyles {
  // static const String _fontFamily = 'Roboto';
  // static const String _fontFamily = 'JetBrainsMono';
  static const String _fontFamily = 'Poppins';

  // --- Display (超大标题，用在数据看板、金额显示等) ---
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.25,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45,
    fontWeight: FontWeight.bold,
  );

  // --- Headline (页面大标题) ---
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  // --- Title (AppBar 标题，卡片标题) ---
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  // --- Body (正文内容) ---
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400, // 用 w400 代替 normal，支持 const
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400, // 用 w400 代替 normal，支持 const
    letterSpacing: 0.25,
  );

  // --- Label (小标签，按钮文字，提示语) ---
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w400, // 用 w400 代替 normal，支持 const
    letterSpacing: 0.5,
  );
}
