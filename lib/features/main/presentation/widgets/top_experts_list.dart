import 'package:consultations_app/features/main/presentation/widgets/expert_short_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopExpertsList extends StatelessWidget {
  const TopExpertsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => const ExpertShortInfoCard(),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 10.w,
        ),
      ),
    );
  }
}
