import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/features/expert/domain/entities/expert_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExpertShortInfoCard extends StatelessWidget {
  final Expert expert;

  const ExpertShortInfoCard({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.gray.withOpacity(0.5),
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15.r),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            context.push(AppRoutes.expertDetailsScreen, extra: expert);
          },
          child: Column(
            children: [
              Hero(
                tag: expert.fullName,
                child: Ink.image(
                  width: 140.w,
                  height: 180.h,
                  image: const AssetImage(
                    AppAssets.expert,
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Expanded(
                child: Container(
                  width: 140.w,
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        expert.fullName,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        expert.about ?? '',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
