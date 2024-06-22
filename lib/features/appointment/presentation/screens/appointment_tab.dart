import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_sliver_appbar.dart';
import 'package:consultations_app/features/appointment/presentation/widgets/appointment_card.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentTab extends StatelessWidget {
  const AppointmentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            PrimarySliverAppbar(
              leading: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: SvgPicture.asset(
                      AppAssets.appLogo,
                      width: 30.w,
                    ),
                  ),
                  const Text(
                    AppStrings.appointment,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomIconButton(
                    icon: Icons.filter_list_rounded,
                    iconColor: AppColors.primary,
                    iconSize: 25,
                    onPressed: () {},
                  ),
                ),
              ],
              sliverBottom: SafeArea(
                bottom: true,
                child: SizedBox(
                  height: 75.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10.sp),
                              border: Border.all(
                                color: AppColors.primary,
                                width: 0.5,
                              ),
                            ),
                            child: const Text(
                              'Upcoming',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              border: Border.all(
                                color: AppColors.primary,
                                width: 0.5,
                              ),
                            ),
                            child: const Text(
                              'Past',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              expandedHeight: 100.h,
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                List.generate(
                  15,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 5.h,
                    ),
                    child: AppointmentCard(
                      icon: index % 3 == 0
                          ? Icons.videocam_rounded
                          : index % 3 == 1
                              ? Icons.call
                              : Icons.message,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
