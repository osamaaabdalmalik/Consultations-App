import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/widgets/custom_sliver_appbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:consultations_app/features/main/presentation/widgets/sub_category_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExpertsAppbar extends StatefulWidget {
  const ExpertsAppbar({super.key});

  @override
  State<ExpertsAppbar> createState() => _ExpertsAppbarState();
}

class _ExpertsAppbarState extends State<ExpertsAppbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppbar(
      leading: Row(
        children: [
          IconButton(
            padding: EdgeInsets.only(left: 8.w),
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          const Text(
            'IT Specialists',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomIconButton(
            icon: Icons.filter_list_rounded,
            iconColor: AppColors.primary,
            onPressed: () {},
          ),
        ),
      ],
      sliverBottom: SizedBox(
        height: 30,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => SubCategoryChip(
            label: index == 0 ? 'All' : 'Brian',
            isSelected: index == selectedIndex,
            onSelected: (isSelected) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 5.w,
          ),
        ),
      ),
      expandedHeight: 100.h,
    );
  }
}
