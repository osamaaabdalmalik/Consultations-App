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

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                child: SvgPicture.asset(
                  AppAssets.forgotPassword,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Text(
                  AppStrings.enterYourRegisteredEmail,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              PrimaryTextField(
                labelText: AppStrings.email,
                hintText: AppStrings.exampleMail,
                controller: TextEditingController(),
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 40.h,
              ),
              PrimaryButton(
                text: AppStrings.getCode,
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
