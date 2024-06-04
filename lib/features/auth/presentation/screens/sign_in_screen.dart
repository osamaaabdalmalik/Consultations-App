import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_icon_button.dart';
import 'package:consultations_app/core/widgets/primary_snack_bar.dart';
import 'package:consultations_app/core/widgets/primary_text_button.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

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
                      AppStrings.signInForFree,
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
              PrimaryTextField(
                labelText: AppStrings.email,
                hintText: AppStrings.exampleMail,
                controller: TextEditingController(),
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20.h,
              ),
              PrimaryTextField(
                labelText: AppStrings.password,
                hintText: AppStrings.moreThan8,
                controller: TextEditingController(),
                isObscureText: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryTextButton(
                      label: AppStrings.forgetPassword,
                      color: AppColors.primary,
                      fontSize: 14,
                      onPressed: () {
                        // context.push(AppRoutes.signUpScreen);
                      },
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                text: AppStrings.signIn,
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      PrimarySnackBar(
                        context: context,
                        title: 'Ops!',
                        message: 'This is an example success message that will be shown in the body of snack bar!',
                      ).build(),
                    );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text(
                AppStrings.orContinueWith,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w500,
                ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.doNotHaveAnAccount,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  PrimaryTextButton(
                    label: AppStrings.signUp,
                    color: AppColors.primary,
                    onPressed: () {
                      context.push(AppRoutes.signUpScreen);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              PrimaryTextButton(
                label: AppStrings.skipThisNow,
                onPressed: () {
                  context.push(AppRoutes.mainScreen);
                },
              ),
              if (MediaQuery.of(context).viewInsets.bottom != 0)
                SizedBox(
                  height: 300.h,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
