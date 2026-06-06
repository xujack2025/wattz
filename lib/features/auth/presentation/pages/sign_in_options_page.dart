import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/button/custom_filled_button.dart';
import '../widgets/logo_filled_button.dart';

class SignInOptionsPage extends StatelessWidget {
  const SignInOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveScaffold(
        appBar: AdaptiveAppBar(),
        body: SafeArea(
          minimum: EdgeInsets.only(top: 120, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign In", style: AppTextStyles.titleLarge),
              SizedBox(height: 16),
              LogoFilledButton(
                backgroundColor: AppColors.black,
                text: "Continue With Apple",
                imagePath: AppMedia.appleLogo,
                textColor: AppColors.white,
                imageColor: AppColors.white,
                onTap: () {},
              ),
              SizedBox(height: 12),
              LogoFilledButton(
                backgroundColor: AppColors.white,
                text: "Continue With Google",
                imagePath: AppMedia.googleLogo,
                textColor: AppColors.black,
                onTap: () {},
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR",
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 24),
              LogoFilledButton(
                text: "Sign In with Phone Number",
                icon: CupertinoIcons.phone,
                backgroundColor: AppColors.primary.withAlpha(20),
                onTap: () {},
              ),
              SizedBox(height: 12),
              LogoFilledButton(
                text: "Sign In with Email",
                icon: CupertinoIcons.mail,
                backgroundColor: AppColors.primary.withAlpha(20),
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(AppRoutes.signInWithEmailPage);
                },
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.onBoardingPreviewPage);
                    },
                    child: Text(
                      "New to Wattz?",
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomFilledButton(
                    text: "Create New Account",
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.signUpWithEmailPage);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.homePage);
                    },
                    child: Text(
                      "Continue As Guest",
                      style: AppTextStyles.labelLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
