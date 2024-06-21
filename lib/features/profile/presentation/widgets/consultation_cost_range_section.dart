import 'package:consultations_app/core/constants/app_colors.dart';import 'package:consultations_app/core/constants/app_strings.dart';import 'package:consultations_app/core/widgets/primary_text_field.dart';import 'package:consultations_app/features/profile/presentation/widgets/contact_select_item.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';class ConsultationCostRangeSection extends StatelessWidget {  final bool isReadOnly;  final double fontSize;  const ConsultationCostRangeSection({    super.key,    this.isReadOnly = false,    this.fontSize = 14,  });  @override  Widget build(BuildContext context) {    return Column(      children: [        Padding(          padding: EdgeInsets.symmetric(horizontal: 15.w),          child: Column(            crossAxisAlignment: CrossAxisAlignment.start,            children: [              Text(                isReadOnly ? AppStrings.includeTheFollowingContactTypes : AppStrings.contactTypes,                style: TextStyle(                  fontSize: fontSize,                  fontWeight: FontWeight.w500,                ),              ),              SizedBox(                height: 10.h,              ),              Row(                children: [                  ContactSelectItem(                    label: AppStrings.messages,                    icon: Icons.message,                    onChange: !isReadOnly ? (value) {} : null,                  ),                  SizedBox(                    width: 5.w,                  ),                  ContactSelectItem(                    label: AppStrings.voiceCalls,                    icon: Icons.call,                    onChange: !isReadOnly ? (value) {} : null,                  ),                  SizedBox(                    width: 5.w,                  ),                  ContactSelectItem(                    label: AppStrings.videoCalls,                    icon: Icons.videocam_rounded,                    onChange: !isReadOnly ? (value) {} : null,                  ),                ],              ),            ],          ),        ),        SizedBox(          height: 30.h,        ),        Padding(          padding: EdgeInsets.symmetric(horizontal: 15.w),          child: Row(            children: [              Text(                AppStrings.costRange,                style: TextStyle(                  fontSize: fontSize,                  fontWeight: FontWeight.w500,                ),              ),            ],          ),        ),        SizedBox(          height: 8.h,        ),        Row(          children: [            Expanded(              child: PrimaryTextField(                labelText: AppStrings.from,                hintText: '0.0',                suffixIcon: const Icon(                  CupertinoIcons.money_dollar,                  color: AppColors.gray,                ),                onTap: isReadOnly ? () {} : null,              ),            ),            Expanded(              child: PrimaryTextField(                labelText: AppStrings.to,                hintText: '0.0',                suffixIcon: const Icon(                  CupertinoIcons.money_dollar,                  color: AppColors.gray,                ),                onTap: isReadOnly ? () {} : null,              ),            ),          ],        ),      ],    );  }}