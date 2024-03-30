import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpertFullInfoCard extends StatelessWidget {
  const ExpertFullInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.fromBorderSide(
          BorderSide(
            width: 1,
            color: AppColors.gray.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100.w,
            height: 120.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.expert,
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Osama Malik",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                      const CustomIconButton(
                        icon: cupertino.CupertinoIcons.heart_fill,
                        iconColor: AppColors.primary,
                        iconSize: 20,
                        size: 35,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        cupertino.CupertinoIcons.bag,
                        size: 15,
                        color: AppColors.primary,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Designer",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "can you tell me about your ",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
