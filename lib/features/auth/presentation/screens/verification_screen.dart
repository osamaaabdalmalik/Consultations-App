import 'package:consultations_app/core/constants/app_assets.dart';
import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_otp_text_field.dart';
import 'package:consultations_app/core/widgets/primary_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                    top: 80.h,
                    bottom: 20.h,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.verifyCode,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Column(
                  children: [
                    Text(
                      AppStrings.enterTheCodeSent,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      AppStrings.exampleMail,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const PrimaryOTPTextField(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '05:15 ${AppStrings.sec}',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.gray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                PrimaryButton(
                  text: AppStrings.verify,
                  width: 200.w,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.doNotReceiveCode,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    PrimaryTextButton(
                      label: AppStrings.resend,
                      color: AppColors.primary,
                      onPressed: () {},
                    ),
                  ],
                ),
                if (MediaQuery.of(context).viewInsets.bottom != 0)
                  SizedBox(
                    height: 50.h,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
