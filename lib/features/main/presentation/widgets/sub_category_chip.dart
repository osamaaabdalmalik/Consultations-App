import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final Color color;
  final void Function(bool isSelected)? onSelected;

  const SubCategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    this.onSelected,
    this.color = AppColors.primary,
  });

  @override
  State<SubCategoryChip> createState() => _SubCategoryChipState();
}

class _SubCategoryChipState extends State<SubCategoryChip> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      showCheckmark: false,
      selectedColor: widget.color,
      visualDensity: VisualDensity.compact,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
        side: BorderSide(color: widget.color),
      ),
      label: Text(
        widget.label,
        style: TextStyle(
          color: widget.isSelected ? AppColors.white : widget.color,
          fontSize: 12,
        ),
      ),
      onSelected: widget.onSelected,
      selected: widget.isSelected,
    );
  }
}
