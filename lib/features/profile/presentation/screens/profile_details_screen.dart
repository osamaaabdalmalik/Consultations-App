import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_appbar.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_photo_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          children: [
            const ProfileAppbar(
              title: AppStrings.profileDetail,
              hasArrowBack: true,
            ),
            const ProfilePhotoSection(),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
