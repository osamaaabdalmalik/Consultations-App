import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_icon_button.dart';
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
    return SafeArea(
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
                        "Top EX",
                        textAlign: TextAlign.center,
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
                    "Sign in for free",
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
              hintText: 'more than 8 character',
              controller: TextEditingController(),
              isObscureText: true,
            ),
            SizedBox(
              height: 30.h,
            ),
            PrimaryButton(
              text: 'Sign in',
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
                  width: 40.h,
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
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                PrimaryTextButton(
                  label: "Sign up",
                  color: AppColors.primary,
                  onPressed: () {
                    context.push(AppRoutes.signUpScreen);
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
    );
  }
}
