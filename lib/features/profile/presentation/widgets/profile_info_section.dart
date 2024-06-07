import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/helpers/pickers.dart';
import 'package:consultations_app/core/widgets/primary_choice_boxes.dart';
import 'package:consultations_app/core/widgets/primary_image_picker.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Row(
            children: [
              Text(
                AppStrings.profileInfo,
                style: TextStyle(
                  fontSize: 24,
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
          height: 20.h,
        ),
        const PrimaryTextField(
          labelText: AppStrings.about,
          hintText: AppStrings.aboutHint,
          isTextArea: true,
        ),
        SizedBox(
          height: 20.h,
        ),
        const PrimaryTextField(
          labelText: AppStrings.address,
          hintText: AppStrings.addressHint,
          suffixIcon: Icon(
            Icons.location_on_outlined,
            color: AppColors.gray,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        PrimaryTextField(
          labelText: AppStrings.birthDate,
          hintText: AppStrings.birthDateHint,
          suffixIcon: const Icon(
            Icons.date_range,
            color: AppColors.gray,
          ),
          onTap: () async {
            String? date = await Pickers.choseDate(context);
            if (date != null) {}
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        const PrimaryChoiceBoxes(
          title: AppStrings.gender,
          label1: AppStrings.male,
          label2: AppStrings.female,
        ),
      ],
    );
  }
}
