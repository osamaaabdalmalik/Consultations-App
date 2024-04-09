import 'package:consultations_app/features/main/presentation/widgets/expert_full_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedExpertsList extends StatelessWidget {
  const RecommendedExpertsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => const ExpertFullInfoCard(),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10.w,
      ),
    );
  }
}
