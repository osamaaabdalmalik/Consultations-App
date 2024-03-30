import 'package:consultations_app/features/main/presentation/widgets/category_experts_appbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/expert_full_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryExpertsScreen extends StatelessWidget {
  const CategoryExpertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CategoryExpertsAppbar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              SizedBox(
                height: 15.h,
              ),
              ...List.generate(
                10,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(
                    bottom: 10.h,
                  ),
                  child: const ExpertFullInfoCard(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
