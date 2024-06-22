import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentCard extends StatelessWidget {
  final IconData icon;

  const AppointmentCard({super.key, required this.icon});

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
          onTap: () {},
          child: Row(
            children: [
              Ink.image(
                width: 80.w,
                height: 90.h,
                image: const AssetImage(
                  AppAssets.expert,
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
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
                              'Expert full name',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          CustomIconButton(
                            icon: icon,
                            iconColor: AppColors.primary,
                            iconSize: 18,
                            size: 30,
                            radius: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.date_range_rounded,
                                size: 15,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                '08-06-2024',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors.gray,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.time,
                                size: 15,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                '10:00 AM',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors.gray,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Status: ',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'pending',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
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
