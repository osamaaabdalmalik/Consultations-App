import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_image_picker.dart';
import 'package:consultations_app/core/widgets/primary_text_button.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:consultations_app/features/auth/presentation/widgets/continue_with_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExpertInfoScreen extends StatelessWidget {
  const ExpertInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Row(
                  children: [
                    Text(
                      AppStrings.setUpYourProfile,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const PrimaryImagePicker(
                labelText: AppStrings.profileImage,
              ),
              SizedBox(
                height: 15.h,
              ),
              PrimaryTextField(
                labelText: AppStrings.fullName,
                hintText: AppStrings.useRealName,
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 15.h,
              ),
              PrimaryTextField(
                labelText: AppStrings.email,
                hintText: AppStrings.exampleMail,
                controller: TextEditingController(),
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15.h,
              ),
              PrimaryTextField(
                labelText: AppStrings.password,
                hintText: AppStrings.makeItStrong,
                controller: TextEditingController(),
                isObscureText: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ).copyWith(
                  top: 5.h,
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5.r),
                  child: Row(
                    children: [
                      Checkbox(
                        value: false, //isAcceptPolicies
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
                              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 5.w),
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
                              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 5.w),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ).copyWith(
                  bottom: 5.h,
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: false, //isAcceptPolicies
                        side: BorderSide(
                          color: AppColors.primary,
                          width: 1.w,
                        ),
                        onChanged: (val) {
                          // controller.isAcceptPolicies = !controller.isAcceptPolicies;
                        },
                      ),
                      Text(
                        "${AppStrings.signUpAsExpert} ",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14,
                              color: AppColors.gray,
                            ),
                      ),
                      PrimaryTextButton(
                        label: AppStrings.moreInfo,
                        fontSize: 14,
                        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 5.w),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                text: AppStrings.signUp,
                onPressed: () {},
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
