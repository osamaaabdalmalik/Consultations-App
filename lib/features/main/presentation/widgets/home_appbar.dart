import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_keys.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/core/widgets/primary_sliver_appbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimarySliverAppbar(
      leading: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: SvgPicture.asset(
              AppAssets.appLogo,
              width: 30.w,
            ),
          ),
          const Text(
            AppStrings.topEx,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      actions: [
        CustomIconButton(
          icon: cupertino.CupertinoIcons.bell_fill,
          iconColor: AppColors.primary,
          iconSize: 20,
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomIconButton(
            icon: cupertino.CupertinoIcons.heart_fill,
            iconColor: AppColors.primary,
            iconSize: 20,
            onPressed: () {
              context.push(
                AppRoutes.expertsScreen,
                extra: {
                  AppKeys.titleScreen: AppStrings.myFavorite,
                  AppKeys.isFavorite: true,
                },
              );
            },
          ),
        ),
      ],
      sliverBottom: Hero(
        tag: AppStrings.searchAboutExperts,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: TextFormField(
            style: const TextStyle(
              fontSize: 14,
            ),
            cursorColor: AppColors.black,
            cursorWidth: 0.8,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: AppStrings.searchAboutExperts,
              suffixIcon: const Icon(
                Icons.search,
                color: AppColors.gray,
              ),
              fillColor: AppColors.primary.withOpacity(0.1),
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none,
              ),
            ),
            readOnly: true,
            onTap: () {
              context.push(
                AppRoutes.expertsScreen,
                extra: {
                  AppKeys.expertsType: ExpertsTypes.topExperts,
                  AppKeys.titleScreen: AppStrings.topExperts,
                  AppKeys.isSearchMode: true,
                },
              );
            },
          ),
        ),
      ),
      expandedHeight: 120.h,
    );
  }
}
