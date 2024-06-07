import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/widgets/primary_choice_boxes.dart';
import 'package:consultations_app/core/widgets/primary_multi_select_item.dart';
import 'package:consultations_app/core/widgets/primary_select_item.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExperiencesInfoSection extends StatelessWidget {
  const ExperiencesInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Row(
            children: [
              Text(
                AppStrings.experiencesInfo,
                style: TextStyle(
                  fontSize: 24,
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
        PrimarySelectItem<String>(
          labelText: AppStrings.specialist,
          hintText: AppStrings.specialistHint,
          onChanged: (value) {},
          items: const [
            DropdownMenuItem(
              value: 'cat1',
              child: Text('cat1'),
            ),
            DropdownMenuItem(
              value: 'cat2',
              child: Text('cat2'),
            ),
            DropdownMenuItem(
              value: 'cat3',
              child: Text('cat3'),
            ),
          ],
          selectedItem: null,
          suffixIcon: const Icon(
            Icons.workspace_premium_sharp,
            color: AppColors.gray,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        PrimaryMultiSelectItem(
          labelText: AppStrings.subSpecialist,
          hintText: AppStrings.subSpecialistHint,
          onChanged: (values) {},
          allItems: const [],
          selectedItems: const [],
          selectedItemsValue: const [],
          suffixIcon: const Icon(
            Icons.workspaces_outline,
            color: AppColors.gray,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        PrimaryMultiSelectItem(
          labelText: AppStrings.experiences,
          hintText: AppStrings.experiencesHint,
          onChanged: (values) {},
          allItems: const [],
          selectedItems: const [],
          selectedItemsValue: const [],
          suffixIcon: const Icon(
            Icons.work_outline,
            color: AppColors.gray,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        const PrimaryChoiceBoxes(
          title: AppStrings.contactTypes,
          label1: AppStrings.messages,
          label2: AppStrings.voiceCalls,
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                AppStrings.consultationCostRange,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.gray,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        const Row(
          children: [
            Expanded(
              child: PrimaryTextField(
                labelText: AppStrings.from,
                hintText: '0.0',
                suffixIcon: Icon(
                  CupertinoIcons.money_dollar,
                  color: AppColors.gray,
                ),
              ),
            ),
            Expanded(
              child: PrimaryTextField(
                labelText: AppStrings.to,
                hintText: '0.0',
                suffixIcon: Icon(
                  CupertinoIcons.money_dollar,
                  color: AppColors.gray,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
