import 'package:consultations_app/features/main/presentation/widgets/specialists_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistsListView extends StatelessWidget {
  const SpecialistsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => const SpecialistsItem(),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 10.w,
        ),
      ),
    );
  }
}
