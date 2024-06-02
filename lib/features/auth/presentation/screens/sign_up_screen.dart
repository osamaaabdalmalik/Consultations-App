import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              text: 'Sign Up',
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
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.facebookLogo,
                  height: 30.w,
                ),
                SizedBox(
                  width: 40.h,
                ),
                SvgPicture.asset(
                  AppAssets.googleLogo,
                  height: 28.w,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account? ",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}
