import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextButton extends StatelessWidget {
  final String label;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final void Function()? onPressed;

  const PrimaryTextButton({
    required this.label,
    this.color = AppColors.black,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 16,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(5.r),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: color,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
        ),
      ),
    );
  }
}
