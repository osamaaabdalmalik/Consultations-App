import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/presentation/widgets/expert_full_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedExpertsList extends StatelessWidget {
  final List<Expert> experts;

  const RecommendedExpertsList({super.key, required this.experts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      itemCount: experts.length,
      cacheExtent: 350.w,
      itemBuilder: (BuildContext context, int index) => ExpertFullInfoCard(
        expert: experts[index],
      ),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10.w,
      ),
    );
  }
}
