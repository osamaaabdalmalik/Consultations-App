import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_choice_boxes.dart';
import 'package:consultations_app/core/widgets/primary_text_button.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:consultations_app/features/auth/presentation/widgets/continue_with_section.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: const Row(
                  children: [
                    Text(
                      AppStrings.signUpForFree,
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const PrimaryTextField(
                labelText: AppStrings.fullName,
                hintText: AppStrings.useRealName,
                suffixIcon: Icon(
                  CupertinoIcons.person,
                  color: AppColors.gray,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const PrimaryTextField(
                labelText: AppStrings.email,
                hintText: AppStrings.exampleMail,
                suffixIcon: Icon(
                  CupertinoIcons.mail,
                  color: AppColors.gray,
                ),
                inputType: TextInputType.emailAddress,
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
                height: 20.h,
              ),
              const PrimaryChoiceBoxes(
                title: AppStrings.accountType,
                label1: AppStrings.user,
                label2: AppStrings.expert,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: false, //isAcceptPolicies
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: BorderSide(
                        color: AppColors.primary,
                        width: 1.w,
                      ),
                      onChanged: (val) {
                        // controller.isAcceptPolicies = !controller.isAcceptPolicies;
                      },
                    ),
                    Expanded(
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "${AppStrings.iAgreeOn} ",
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                  fontSize: 14,
                                  color: AppColors.gray,
                                ),
                          ),
                          PrimaryTextButton(
                            label: AppStrings.privacyPolicies,
                            fontSize: 14,
                            onPressed: () {},
                          ),
                          Text(
                            "&",
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                  fontSize: 14,
                                  color: AppColors.gray,
                                ),
                          ),
                          PrimaryTextButton(
                            label: AppStrings.tearm,
                            fontSize: 14,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              PrimaryButton(
                text: AppStrings.signUp,
                onPressed: () {
                  context.push(AppRoutes.expertInfoScreen);
                },
              ),
              const ContinueWithSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.alreadyHaveAnAccount,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  PrimaryTextButton(
                    label: AppStrings.signIn,
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
