import 'package:consultations_app/features/main/domain/entities/main_category_entity.dart';
import 'package:consultations_app/features/main/presentation/widgets/specialist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistsList extends StatelessWidget {
  final List<MainCategory> mainCategories;

  const SpecialistsList({super.key, required this.mainCategories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        itemCount: mainCategories.length,
        itemBuilder: (BuildContext context, int index) => SpecialistCard(
          mainCategory: mainCategories[index],
        ),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 10.w,
        ),
      ),
    );
  }
}
