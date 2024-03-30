import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final bool hasSeeAll;

  const HeaderSection({
    super.key,
    required this.title,
    this.hasSeeAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
            ),
          ),
          Text(
            hasSeeAll ? "See all" : '',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
