import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/button/custom_filled_button.dart';
import '../../../../core/widgets/text_field/custom_text_field.dart';

class SignInWithEmail extends StatelessWidget {
  const SignInWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text("Sign In With Email Address"),
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 60),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email Address"),
                SizedBox(height: 4),
                CustomTextField(autofillHints: [AutofillHints.email]),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Password"),
                SizedBox(height: 4),
                CustomTextField(autofillHints: [AutofillHints.password]),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              enableFeedback: true,
            ),
            onPressed: () {},
            child: Text("Forgot Password?", style: AppTextStyles.labelSmall),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [CustomFilledButton(text: "Sign In", onTap: () {})],
            ),
          ),
        ],
      ),
    );
  }
}
