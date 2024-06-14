import 'package:consultations_app/core/constants/app_assets.dart';import 'package:consultations_app/core/constants/app_colors.dart';import 'package:consultations_app/core/widgets/primary_icon_button.dart';import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:go_router/go_router.dart';class ProfileAppbar extends StatelessWidget {  final String title;  final bool hasArrowBack;  const ProfileAppbar({    super.key,    required this.title,    this.hasArrowBack = false,  });  @override  Widget build(BuildContext context) {    return Padding(      padding: EdgeInsets.symmetric(horizontal: 5.h),      child: Row(        mainAxisAlignment: MainAxisAlignment.spaceBetween,      children: [        Row(          children: [            if (!hasArrowBack)              Padding(                padding: EdgeInsets.symmetric(horizontal: 8.0.w),                child: SvgPicture.asset(                  AppAssets.appLogo,                  width: 30.w,                ),              ),            if (hasArrowBack)              Padding(                  padding: EdgeInsetsDirectional.only(end: 6.w),                  child: PrimaryIconButton(                  icon: const Icon(                    Icons.arrow_back_ios,                  ),                  color: AppColors.transparent,                  padding: EdgeInsetsDirectional.all(10.h).copyWith(                    start: 15.h,                    end: 5.h,                  ),                  onPressed: () {                    context.pop();                  },                ),              ),            Text(              title,              style: const TextStyle(                fontSize: 24,                fontWeight: FontWeight.w700,                color: AppColors.black,              ),            ),          ],        ),        Row(          children: [            Padding(              padding: EdgeInsets.symmetric(horizontal: 10.w),              child: CustomIconButton(                icon: Icons.more_vert,                iconColor: AppColors.primary,                iconSize: 25,                onPressed: () {},              ),            ),          ],        ),      ],      ),    );  }}