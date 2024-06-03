import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_icon_button.dart';
import 'package:consultations_app/core/widgets/primary_text_button.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.appLogo,
                      width: 60.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top EX",
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "for consultations",
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
                      "Sign up for free",
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
                height: 15.h,
              ),
              PrimaryTextField(
                labelText: 'Full Name',
                hintText: 'use real name',
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 25.h,
              ),
              PrimaryTextField(
                labelText: 'Email',
                hintText: 'example@mail.com',
                controller: TextEditingController(),
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 25.h,
              ),
              PrimaryTextField(
                labelText: 'Password',
                hintText: 'make it strong',
                controller: TextEditingController(),
                isObscureText: true,
              ),
              SizedBox(
                height: 30.h,
              ),
              PrimaryButton(
                text: 'Sign up',
                onPressed: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text(
                "or continue with",
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
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  PrimaryTextButton(
                    label: "Sign in",
                    color: AppColors.primary,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
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
