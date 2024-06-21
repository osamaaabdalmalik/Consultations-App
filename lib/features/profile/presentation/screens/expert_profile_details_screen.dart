import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_icon_button.dart';
import 'package:consultations_app/core/widgets/sample_sliver_appbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:consultations_app/features/profile/presentation/widgets/consultation_cost_range_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_about_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_experience_section.dart';
import 'package:consultations_app/features/profile/presentation/widgets/work_times_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
                    icon: Icons.edit_note,
                    iconColor: AppColors.primary,
                    iconSize: 25,
                    onPressed: () {
                      context.push(AppRoutes.completeExpertInfoScreen);
                    },
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: AppAssets.expert1,
                        child: Container(
                          width: 150.w,
                          height: 150.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primary, width: 2),
                            image: const DecorationImage(
                              image: AssetImage(
                                AppAssets.expert1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Hero(
                        tag: 'Osama Abd Al Malik',
                        child: Text(
                          'Osama Abd Al Malik',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Hero(
                        tag: 'osamaaabdalmalik@gmail.com',
                        child: Text(
                          'osamaaabdalmalik@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                PrimaryIconButton(
                                  icon: const Icon(
                                    Icons.collections_bookmark_rounded,
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                const Text(
                                  '15 bookings',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                PrimaryIconButton(
                                  icon: const Icon(
                                    Icons.star_rounded,
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                const Text(
                                  '4.7 Rating',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                PrimaryIconButton(
                                  icon: const Icon(
                                    Icons.reviews,
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                const Text(
                                  '15 reviews',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const ProfileAboutSection(),
                  const ProfileExperienceSection(),
                  const ConsultationCostRangeSection(isReadOnly: true),
                  Divider(
                    color: AppColors.grayAccent,
                    height: 50.h,
                    indent: 5.w,
                    endIndent: 5.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Row(
                      children: [
                        Text(
                          AppStrings.schedule,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
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
