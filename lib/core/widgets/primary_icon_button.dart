import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryIconButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final void Function()? onPressed;

  const PrimaryIconButton({
    required this.icon,
    this.color = AppColors.primary,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(5.r),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: icon,
      ),
    );
  }
}
