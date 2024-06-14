import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSettingCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final bool showArrow;
  final void Function()? onTap;

  const ProfileSettingCard({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor = AppColors.primary,
    this.onTap,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomIconButton(
                        icon: icon,
                        iconColor: iconColor,
                        iconSize: 25,
                        size: 50,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  if (showArrow)
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 30.w,
                    )
                ],
              ),
            ),
            Divider(
              color: AppColors.grayAccent,
              height: 1.h,
              indent: 5.w,
              endIndent: 5.w,
            ),
          ],
        ),
      ),
    );
  }
}
