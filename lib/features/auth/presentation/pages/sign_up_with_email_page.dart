import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/button/custom_filled_button.dart';
import '../../../../core/widgets/text_field/custom_text_field.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../bloc/sign_up/sign_up_bloc.dart';

class SignUpWithEmailPage extends StatelessWidget {
  const SignUpWithEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status == SignUpStatus.success) {
          context.read<ProfileBloc>().add(const IsSignInEvent());
          Navigator.of(context).pushNamed(AppRoutes.homePage);
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          final isLoading = state.status == SignUpStatus.loading;
          return Scaffold(
            body: AdaptiveScaffold(
              appBar: AdaptiveAppBar(
                title: "Create New Account",
                useNativeToolbar: true,
              ),
              body: SafeArea(
                minimum: EdgeInsets.only(top: 120),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text("First Name"),
                      //       SizedBox(height: 4),
                      //       CustomTextField(
                      //         autofillHints: [AutofillHints.givenName],
                      //         onChanged: (firstName) {
                      //           // context.read<SignInBloc>().add(EmailEvent(email));
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text("Last Name"),
                      //       SizedBox(height: 4),
                      //       CustomTextField(
                      //         autofillHints: [AutofillHints.familyName],
                      //         onChanged: (lastName) {
                      //           // context.read<SignInBloc>().add(EmailEvent(email));
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
                                context.read<SignUpBloc>().add(
                                  EmailEvent(email),
                                );
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
                                context.read<SignUpBloc>().add(
                                  PasswordEvent(password),
                                );
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
                            Text("Confirm Password"),
                            SizedBox(height: 4),
                            CustomTextField(
                              autofillHints: [AutofillHints.password],
                              isPassword: true,
                              onChanged: (confirmPassword) {
                                context.read<SignUpBloc>().add(
                                  ConfirmPasswordEvent(confirmPassword),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            CustomFilledButton(
                              text: "Submit",
                              onTap: () {
                                if (!isLoading) {
                                  context.read<SignUpBloc>().add(
                                    SignUpSubmittedEvent(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "By registering, you agree to the Terms of Use and Privacy Policy, including cookie use.",
                          style: AppTextStyles.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
