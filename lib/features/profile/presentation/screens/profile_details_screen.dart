import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_about_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_appbar.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_experience_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_photo_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/work_times_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
            children: [
              const ProfileAppbar(
                title: AppStrings.profileDetail,
                hasArrowBack: true,
              ),
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
      ),
    );
  }
}
