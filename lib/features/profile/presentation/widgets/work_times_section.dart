import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_choice_boxes.dart';
import 'package:consultations_app/features/profile/presentation/widgets/time_range_expansion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkTimesSection extends StatelessWidget {
  const WorkTimesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Row(
            children: [
              Text(
                AppStrings.schedule,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const PrimaryChoiceBoxes(
          title: '',
          label1: AppStrings.alwaysOpen,
          label2: AppStrings.selectedHours,
        ),
        SizedBox(
          height: 15.h,
        ),
        const TimeRangePickerExpansion(
          title: 'Sunday',
          isAlwaysOpen: false,
        ),
        const TimeRangePickerExpansion(
          title: 'Monday',
          isAlwaysOpen: true,
        ),
        const TimeRangePickerExpansion(
          title: 'Tuesday',
          isAlwaysOpen: true,
        ),
        const TimeRangePickerExpansion(
          title: 'Tuesday',
          isAlwaysOpen: true,
        ),
        const TimeRangePickerExpansion(
          title: 'Wednesday',
          isAlwaysOpen: true,
        ),
        const TimeRangePickerExpansion(
          title: 'Thursday',
          isAlwaysOpen: true,
        ),
        const TimeRangePickerExpansion(
          title: 'Friday',
          isAlwaysOpen: true,
        ),
      ],
    );
  }
}
