import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryChoiceBoxes extends StatelessWidget {
  final String title;
  final String label1;
  final String label2;

  const PrimaryChoiceBoxes({
    super.key,
    required this.title,
    required this.label1,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.gray,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Checkbox(
                    value: true,
                    //isAcceptPolicies
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
                  Text(
                    label1,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 14,
                          color: AppColors.gray,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    //isAcceptPolicies
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
                  Text(
                    label2,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 14,
                          color: AppColors.gray,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
