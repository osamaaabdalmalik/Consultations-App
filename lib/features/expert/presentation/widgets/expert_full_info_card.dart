import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/features/expert/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExpertFullInfoCard extends StatelessWidget {
  final Expert expert;

  const ExpertFullInfoCard({super.key, required this.expert});

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
          child: Row(
            children: [
              Hero(
                tag: expert.fullName,
                child: Ink.image(
                  width: 100.w,
                  height: 120.h,
                  image: const AssetImage(
                    AppAssets.expert,
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
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
                          Expanded(
                            child: Text(
                              expert.fullName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          CustomIconButton(
                            icon: CupertinoIcons.heart_fill,
                            iconColor: AppColors.primary,
                            iconSize: 20,
                            size: 35,
                            radius: 10,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.star_fill,
                            size: 15,
                            color: AppColors.primary,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SizedBox(
                            width: 150.w,
                            child: Text(
                              '${expert.rating} (${expert.ratingNumber} reviews)',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        expert.about ?? '',
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
        ),
      ),
    );
  }
}
