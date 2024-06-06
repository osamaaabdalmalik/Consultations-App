import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/helpers/pickers.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/core/widgets/primary_choice_boxes.dart';
import 'package:consultations_app/core/widgets/primary_expansion_title.dart';
import 'package:consultations_app/core/widgets/primary_image_picker.dart';
import 'package:consultations_app/core/widgets/primary_multi_select_item.dart';
import 'package:consultations_app/core/widgets/primary_select_item.dart';
import 'package:consultations_app/core/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpertInfoScreen extends StatelessWidget {
  const ExpertInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 15.h,
              ),
              const PrimaryTextField(
                labelText: AppStrings.about,
                hintText: AppStrings.aboutHint,
                isTextArea: true,
              ),
              SizedBox(
                height: 15.h,
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
                height: 15.h,
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
                height: 15.h,
              ),
              const PrimaryChoiceBoxes(
                title: AppStrings.gender,
                label1: AppStrings.male,
                label2: AppStrings.female,
              ),
              SizedBox(
                height: 15.h,
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
                height: 15.h,
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
                height: 15.h,
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
                height: 15.h,
              ),
              const PrimaryChoiceBoxes(
                title: AppStrings.contactTypes,
                label1: AppStrings.messages,
                label2: AppStrings.voiceCalls,
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  AppStrings.workTimes,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.gray,
                        fontSize: 14,
                      ),
                ),
              ),
              PrimaryExpansionTile(
                title: 'Saturday',
                children: [
                  Row(
                    children: [
                      Text(
                        'Start',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.gray,
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    'End',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.gray,
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
              const PrimaryExpansionTile(title: 'Sunday'),
              const PrimaryExpansionTile(title: 'Monday'),
              const PrimaryExpansionTile(title: 'Tuesday'),
              const PrimaryExpansionTile(title: 'Wednesday'),
              const PrimaryExpansionTile(title: 'Thursday'),
              const PrimaryExpansionTile(title: 'Friday'),
              SizedBox(
                height: 30.h,
              ),
              PrimaryButton(
                text: AppStrings.save,
                onPressed: () {},
              ),
              SizedBox(
                height: 30.h,
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
