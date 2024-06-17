import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/sample_sliver_appbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_about_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_experience_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_photo_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/work_times_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpertProfileDetailsScreen extends StatelessWidget {
  const ExpertProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SampleSliverAppbar(
              title: AppStrings.profileDetail,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomIconButton(
                    icon: Icons.more_vert,
                    iconColor: AppColors.primary,
                    iconSize: 25,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  const ProfilePhotoSection(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const ProfileAboutSection(),
                  const ProfileExperienceSection(),
                  const WorkTimesSection(),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
