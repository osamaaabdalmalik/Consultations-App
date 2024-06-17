import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/sample_sliver_appbar.dart';
import 'package:consultations_app/features/expert/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/expert/presentation/widgets/expert_full_info_card.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_experience_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/work_times_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpertDetailsScreen extends StatelessWidget {
  final Expert expert;

  const ExpertDetailsScreen({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SampleSliverAppbar(
              title: expert.fullName,
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 20.h,
                    ),
                    child: ExpertFullInfoCard(
                      expert: expert,
                      showFavoriteButton: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.about,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          'Hello Adam, I am Dr. Eleanor Pena. I will help to solve your disease complaints.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ProfileExperienceSection(),
                  const WorkTimesSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
