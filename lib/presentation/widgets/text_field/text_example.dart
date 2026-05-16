import 'package:flutter/material.dart';
import 'package:wattz/core/constants/app_text_styles.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("This is displayLarge", style: AppTextStyles.displayLarge),
          Text("This is displayMedium", style: AppTextStyles.displayMedium),
          Text("This is headlineLarge", style: AppTextStyles.headlineLarge),
          Text("This is headlineMedium", style: AppTextStyles.headlineMedium),
          Text("This is titleLarge", style: AppTextStyles.titleLarge),
          Text("This is titleMedium", style: AppTextStyles.titleMedium),
          Text("This is bodyLarge", style: AppTextStyles.bodyLarge),
          Text("This is bodyMedium", style: AppTextStyles.bodyMedium),
          Text("This is labelLarge", style: AppTextStyles.labelLarge),
          Text("This is labelSmall", style: AppTextStyles.labelSmall),
        ],
      ),
    );
  }
}
