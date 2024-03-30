import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SpecialistsItem extends StatelessWidget {
  const SpecialistsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutes.categoryExpertsScreen);
      },
      // TODO enable splash effect
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 120.w,
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.primary10,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              cupertino.CupertinoIcons.heart_fill,
              size: 50.h,
              color: AppColors.white,
            ),
            Text(
              "Medicine",
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),
            Text(
              "180 Specialists",
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
