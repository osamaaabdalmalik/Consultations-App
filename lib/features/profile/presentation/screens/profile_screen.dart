import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_appbar.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_photo_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_setting_card.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        children: [
          const ProfileAppbar(),
          const ProfilePhotoSection(),
          SizedBox(
            height: 15.h,
          ),
          ProfileSettingCard(
            title: AppStrings.profileDetail,
            icon: CupertinoIcons.person_fill,
            onTap: () {},
          ),
          ProfileSettingCard(
            title: AppStrings.notifications,
            icon: CupertinoIcons.bell_fill,
            onTap: () {},
          ),
          ProfileSettingCard(
            title: AppStrings.myFavorite,
            icon: CupertinoIcons.heart_fill,
            onTap: () {},
          ),
          ProfileSettingCard(
            title: AppStrings.changePassword,
            icon: CupertinoIcons.lock_fill,
            onTap: () {},
          ),
          ProfileSettingCard(
            title: AppStrings.about,
            icon: CupertinoIcons.info_circle_fill,
            onTap: () {},
          ),
          ProfileSettingCard(
            title: AppStrings.help,
            icon: Icons.help,
            onTap: () {},
          ),
          ProfileSettingCard(
            title: AppStrings.logout,
            icon: Icons.logout,
            iconColor: AppColors.danger,
            showArrow: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
