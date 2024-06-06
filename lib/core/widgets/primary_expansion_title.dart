import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryExpansionTile extends StatelessWidget {
  final String title;
  final String? content;
  final List<Widget> children;
  final bool initiallyExpanded;

  const PrimaryExpansionTile({
    required this.title,
    this.content,
    this.initiallyExpanded = false,
    this.children = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          ExpansionTile(
            tilePadding: EdgeInsetsDirectional.only(end: 10.w),
            iconColor: AppColors.gray,
            collapsedIconColor: AppColors.gray,
            title: Row(
              children: [
                Transform.scale(
                  scale: 0.6,
                  child: Switch(
                    value: true, //isAcceptPolicies
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (val) {
                      // controller.isAcceptPolicies = !controller.isAcceptPolicies;
                    },
                  ),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 14,
                        color: AppColors.gray,
                      ),
                ),
              ],
            ),
            childrenPadding: EdgeInsets.zero,
            initiallyExpanded: initiallyExpanded,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            ],
          ),
          const Divider(
            color: AppColors.gray,
            thickness: 0.5,
            height: 0,
          ),
        ],
      ),
    );
  }
}
