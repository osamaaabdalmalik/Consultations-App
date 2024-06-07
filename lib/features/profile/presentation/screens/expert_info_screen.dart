import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/features/profile/presentation/widgets/experiences_info_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_info_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/work_times_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpertInfoScreen extends StatelessWidget {
  const ExpertInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileInfoSection(),
              SizedBox(
                height: 15.h,
              ),
              const Divider(
                color: AppColors.gray,
                thickness: 0.5,
                height: 50,
              ),
              const ExperiencesInfoSection(),
              SizedBox(
                height: 15.h,
              ),
              const Divider(
                color: AppColors.gray,
                thickness: 0.5,
                height: 50,
              ),
              const WorkTimesSection(),
              SizedBox(
                height: 30.h,
              ),
              PrimaryButton(
                text: AppStrings.save,
                onPressed: () {},
              ),
              SizedBox(
                height: 30.h,
              ),
              if (MediaQuery.of(context).viewInsets.bottom != 0)
                SizedBox(
                  height: 300.h,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
