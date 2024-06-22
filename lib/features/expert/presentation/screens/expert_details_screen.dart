import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_icon_button.dart';
import 'package:consultations_app/core/widgets/sample_sliver_appbar.dart';
import 'package:consultations_app/features/expert/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:consultations_app/features/profile/presentation/widgets/profile_experience_section.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
                    icon: CupertinoIcons.heart_fill,
                    iconColor: AppColors.primary,
                    iconSize: 20,
                    onPressed: () {},
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
                        tag: expert.fullName,
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
                      Text(
                        expert.fullName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
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
                    height: 25.h,
                  ),
                  PrimaryButton(
                    text: AppStrings.makeAppointment,
                    onPressed: () {
                      context.push(
                        AppRoutes.makeAppointmentScreen,
                        extra: expert,
                      );
                    },
                  ),
                  SizedBox(
                    height: 25.h,
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
                            fontSize: 18,
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
                    height: 25.h,
                  ),
                  const ProfileExperienceSection(),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.book),
      //   // extendedPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10.w),
      //   // icon: const Icon(Icons.book),
      //   // label: const Text('Book now'),
      // ),
    );
  }
}
