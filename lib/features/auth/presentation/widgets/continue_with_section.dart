import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueWithSection extends StatelessWidget {
  const ContinueWithSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                indent: 50.w,
                endIndent: 10.w,
                thickness: 1,
                color: AppColors.gray,
              ),
            ),
            const Text(
              AppStrings.orContinueWith,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.gray,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Divider(
                indent: 10.w,
                endIndent: 50.w,
                thickness: 1,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryIconButton(
              icon: SvgPicture.asset(
                AppAssets.facebookLogo,
                height: 30.w,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 25.h,
            ),
            PrimaryIconButton(
              icon: SvgPicture.asset(
                AppAssets.appleLogo,
                height: 30.w,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 25.h,
            ),
            PrimaryIconButton(
              icon: SvgPicture.asset(
                AppAssets.googleLogo,
                height: 28.w,
              ),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    );
  }
}
