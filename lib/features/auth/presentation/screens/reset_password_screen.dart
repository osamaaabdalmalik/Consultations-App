import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                  top: 50.h,
                  bottom: 20.h,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppAssets.appLogo,
                      width: 60.w,
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    const Column(
                      children: [
                        Text(
                          AppStrings.topEx,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          AppStrings.forConsultations,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.gray,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Row(
                  children: [
                    Text(
                      AppStrings.resetYourPassword,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const PrimaryTextField(
                labelText: AppStrings.password,
                hintText: AppStrings.makeItStrong,
                isObscureText: true,
              ),
              SizedBox(
                height: 25.h,
              ),
              const PrimaryTextField(
                labelText: AppStrings.confirmPassword,
                hintText: AppStrings.reEnterPassword,
                isObscureText: true,
              ),
              SizedBox(
                height: 40.h,
              ),
              PrimaryButton(
                text: AppStrings.reset,
                width: 200.w,
                onPressed: () {
                  context.push(AppRoutes.verificationScreen);
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              if (MediaQuery.of(context).viewInsets.bottom != 0)
                SizedBox(
                  height: 50.h,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
