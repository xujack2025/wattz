import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/button/custom_filled_button.dart';
import '../../../../core/widgets/text_field/custom_text_field.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../bloc/sign_in/sign_in_bloc.dart';

class SignInWithEmailPage extends StatelessWidget {
  const SignInWithEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.status == SignInStatus.success) {
          context.read<ProfileBloc>().add(const IsSignInEvent());
          Navigator.of(context).pushNamed(AppRoutes.profilePage);
        }
        if (state.status == SignInStatus.failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          final isLoading = state.status == SignInStatus.loading;

          return Scaffold(
            backgroundColor: AppColors.bgColor,
            // appBar: AppBar(
            //   centerTitle: false,
            //   title: Text(
            //     "Sign In With Email Address",
            //     style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
            //   ),
            //   backgroundColor: AppColors.white,
            // ),
            body: AdaptiveScaffold(
              appBar: AdaptiveAppBar(
                useNativeToolbar: true,
                title: "Sign In With Email Address",
              ),
              body: SafeArea(
                minimum: EdgeInsets.only(top: 120, left: 16, right: 16),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email Address"),
                          SizedBox(height: 4),
                          CustomTextField(
                            hintText: "Enter email address",
                            autofillHints: [AutofillHints.email],
                            onChanged: (email) {
                              context.read<SignInBloc>().add(EmailEvent(email));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Password"),
                          SizedBox(height: 4),
                          CustomTextField(
                            autofillHints: [AutofillHints.password],
                            isPassword: true,
                            onChanged: (password) {
                              context.read<SignInBloc>().add(
                                PasswordEvent(password),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        enableFeedback: true,
                      ),
                      onPressed: () {
                        // TODO
                      },
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyles.labelSmall,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          CustomFilledButton(
                            text: isLoading ? "Signing In..." : "Sign In",
                            onTap: () {
                              if (!isLoading) {
                                context.read<SignInBloc>().add(
                                  SignInSubmittedEvent(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
