import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/features/profile/presentation/widgets/time_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeRangePickerExpansion extends StatefulWidget {
  final String title;
  final String? content;
  final List<Widget> children;
  final bool isAlwaysOpen;
  final bool initiallyExpanded;

  const TimeRangePickerExpansion({
    required this.title,
    this.content,
    this.isAlwaysOpen = true,
    this.initiallyExpanded = false,
    this.children = const [],
    super.key,
  });

  @override
  State<TimeRangePickerExpansion> createState() => _TimeRangePickerExpansionState();
}

class _TimeRangePickerExpansionState extends State<TimeRangePickerExpansion> {
  bool isSelected = true;
  TimeOfDay fromTime = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay toTime = const TimeOfDay(hour: 16, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          ExpansionTile(
            tilePadding: EdgeInsetsDirectional.zero,
            iconColor: AppColors.gray,
            collapsedIconColor: AppColors.gray,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 14,
                          color: AppColors.gray,
                        ),
                  ),
                  Text(
                    !isSelected
                        ? AppStrings.closed
                        : widget.isAlwaysOpen
                            ? AppStrings.open24Hours
                            : '${fromTime.format(context)} -> ${toTime.format(context)}',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 10,
                          color: AppColors.gray,
                        ),
                  ),
                ],
              ),
            ),
            trailing: Transform.scale(
              scale: 0.6,
              child: Switch(
                value: isSelected,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                inactiveTrackColor: AppColors.gray,
                onChanged: (val) {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
              ),
            ),
            onExpansionChanged: (value) {
              if (widget.isAlwaysOpen || (!isSelected && !widget.isAlwaysOpen)) {
                setState(() {
                  isSelected = !isSelected;
                });
              }
            },
            childrenPadding: EdgeInsets.zero,
            initiallyExpanded: widget.initiallyExpanded,
            children: !isSelected || widget.isAlwaysOpen
                ? []
                : [
                    const Divider(
                      color: AppColors.gray,
                      thickness: 0.5,
                      height: 1,
                    ),
                    TimeRangePicker(
                      onTab: (from, to) {
                        setState(() {
                          fromTime = from;
                          toTime = to;
                        });
                      },
                      doneText: AppStrings.confirm,
                      dismissText: AppStrings.cancel,
                      timeHintColor: AppColors.gray,
                      colonColor: AppColors.primary,
                      activeDayNightColor: AppColors.primary,
                      dividerColor: AppColors.gray,
                      dismissTextColor: AppColors.gray,
                      doneTextColor: AppColors.primary,
                    ),
                  ],
          ),
          const Divider(
            color: AppColors.gray,
            thickness: 0.5,
            height: 0,
          ),
        ],
      ),
    );
  }
}
