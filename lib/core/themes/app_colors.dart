import 'package:flutter/material.dart';

abstract class AppColors {
  // ==========================================
  // 1. 原创核心配色 (Core Palette)
  // ==========================================
  /// 浅蓝 - 主色调 (Primary / Action)
  static const Color primary = Color(0xFF00A3FF);

  /// 青色 - 成功 / 重点高亮 (Success / Accent)
  static const Color green = Color(0xFF22BC87);

  /// 深蓝 - 次要视觉 (Secondary / Info)
  static const Color darkBlue = Color(0xFF069FC8);

  /// 灰色 - 核心背景 (Primary Background)
  static const Color bgColor = Color(0xFFF4F6FC);

  /// 深黑蓝 - 次要背景 (Secondary Background)
  static const Color deepDarkBlue = Color(0xFF07273A);

  // ==========================================
  // 2. 衍生中性色 (Neutral Palette - 适配深黑蓝背景)
  // ==========================================
  /// 卡片/容器背景 (Surface) - 比深黑蓝稍亮，拉开视觉层级
  static const Color surface = Color(0xFF0D354E);

  /// 纯白主要文字 (Text Primary)
  static const Color textPrimary = Color(0xFF1E1E1E);

  /// 浅灰次要文字 (Text Secondary) - 适合用在 subtitle 或时间戳
  static const Color textSecondary = Color(0xFF8A9FB4);

  /// 边框 / 分割线 (Border / Divider)
  static const Color border = Color(0xFF164766);

  /// 禁用状态灰色 (Disabled)
  static const Color disabled = Color(0xFF4A6577);

  // ==========================================
  // 3. 衍生功能色 (Semantic Palette)
  // ==========================================
  /// 错误 / 警告红色 (Error) - 带有一点点蓝调的冷红，配合你的主色
  static const Color error = Color(0xFFFF4D6A);

  /// 提示黄色 (Warning)
  static const Color warning = Color(0xFFFFB800);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color darkGrey = Color(0xFF757575);
}

/* import 'package:flutter/material.dart';

class AppColors {
  // 🔹 **Primary Blue Shades**
  static const Color primary = Color(0xFF007BFF); // Bright Blue
  static const Color primaryDark = Color(0xFF0056B3); // Dark Blue
  static const Color primaryLight = Color(0xFF66B2FF); // Light Blue

  // 🔹 **Secondary Blue Shades**
  static const Color secondary = Color(0xFF4A90E2); // Soft Blue
  static const Color secondaryDark = Color(0xFF357ABD); // Darker Blue
  static const Color secondaryLight = Color(0xFFA3D5FF); // Lighter Blue

  // 🔹 **Gradient Blues**
  static const Color gradientStart = Color(0xFF007BFF); // Start of gradient
  static const Color gradientEnd = Color(0xFF004AAD); // End of gradient

  // 🔹 **Background Blues**
  static const Color backgroundBlue = Color(
    0xFFE3F2FD,
  ); // Light Blue Background
  static const Color backgroundDarkBlue = Color(
    0xFF1E3A5F,
  ); // Deep Blue Background

  static const Color backgroundGrey = Color(0xFFEEEEEE);

  // 🔹 **Blue for Buttons & Highlights**
  static const Color buttonBlue = Colors.blue; // Standard Button Blue
  static const Color buttonHoverBlue = Color(0xFF004C99); // Darker Hover Effect

  // 🔹 **Blue for Text & Borders**
  static const Color textBlue = Color(0xFF1C6DD0); // Blue Text Color
  static const Color borderBlue = Color(0xFF6699CC); // Soft Blue Border

  // 🔹 **Status Indicators (Blue Variations)**
  static const Color successBlue = Color(0xFF2A9DF4); // Bright Success Blue
  static const Color infoBlue = Color(0xFF17A2B8); // Blue-Green Info Color
  static const Color alertBlue = Color(0xFF4682B4); // Steel Blue for Alerts

  // 🔹 **Transparent & Custom Blues**
  static const Color transparentBlue = Color(
    0x66007BFF,
  ); // Semi-transparent Blue
  static const Color disabledBlue = Color(
    0xFFB0C4DE,
  ); // Light Blue Disabled State

  static const Color danger = Color(0xFFFF4D4D); // Red for errors/warnings
  static const Color background = Color(0xFFF5F5F5); // Light gray background
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color darkGrey = Color(0xFF757575);
}
*/
