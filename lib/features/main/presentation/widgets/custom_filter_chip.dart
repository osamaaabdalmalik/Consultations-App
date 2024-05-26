import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilterChip extends StatefulWidget {
  final String label;
  final void Function()? onDeleted;

  const CustomFilterChip({
    super.key,
    required this.label,
    this.onDeleted,
  });

  @override
  State<CustomFilterChip> createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
        side: const BorderSide(color: AppColors.primary),
      ),
      label: Text(
        widget.label,
        style: const TextStyle(
          color: AppColors.black,
        ),
      ),
      onDeleted: widget.onDeleted,
    );
  }
}
