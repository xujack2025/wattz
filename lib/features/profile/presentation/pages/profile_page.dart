import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/button/custom_filled_button.dart';
import '../../../../core/widgets/button/title_text_button.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/row_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ProfileBloc>();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text("Account"),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        displacement: 0,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          read.add(const IsSignInEvent());
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.status == ProfileStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == ProfileStatus.success) {
              return const CustomerProfile();
            }
            return const GuestProfile();
          },
        ),
      ),
    );
  }
}

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome", style: AppTextStyles.titleLarge),
              const SizedBox(height: 16),
              Row(
                children: [
                  CustomFilledButton(
                    text: "Log Out",
                    onTap: () {
                      context.read<ProfileBloc>().add(const LogOutEvent());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GuestProfile extends StatelessWidget {
  const GuestProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign in for Exclusive\nMember's Perks",
                          style: AppTextStyles.titleLarge,
                        ),
                        SizedBox(height: 6),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                "VIEW ALL BENEFITS",
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                CupertinoIcons.chevron_right,
                                size: 14,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: NetworkImage("https://placehold.co/100x100.png"),
                      ),
                    ),
                  ),
                ],
              ),
              // Sign In Button
              Row(
                children: [
                  CustomFilledButton(
                    text: "Sign In Now",
                    onTap: () async {
                      await Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.signInPage);
                      if (context.mounted) {
                        context.read<ProfileBloc>().add(const IsSignInEvent());
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        /// My Account
        Column(
          children: [
            TitleTextButton(text: "My Account", buttonIcon: false),
            SizedBox(height: 4),
            RowButton(text: "Charging History", onTap: () {}),
          ],
        ),

        /// Others
        SizedBox(height: 6),
        Column(
          children: [
            TitleTextButton(text: "Others", buttonIcon: false),
            SizedBox(height: 4),
            RowButton(text: "App Walkthrough", onTap: () {}),
            RowButton(text: "F.A.Q.", onTap: () {}),
            RowButton(text: "Contact Us", onTap: () {}),
            RowButton(text: "Terms of Use", onTap: () {}),
            RowButton(text: "Privacy Policy", onTap: () {}),
          ],
        ),
      ],
    );
  }
}
