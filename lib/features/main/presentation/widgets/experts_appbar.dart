import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/widgets/custom_sliver_appbar.dart';
import 'package:consultations_app/features/main/presentation/cubits/expert_cubit/expert_cubit.dart';
import 'package:consultations_app/features/main/presentation/cubits/experts_filters_cubit/experts_filters_cubit.dart';
import 'package:consultations_app/features/main/presentation/widgets/current_experts_filters.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:consultations_app/features/main/presentation/widgets/experts_filters_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExpertsAppbar extends StatelessWidget {
  final String title;
  final BuildContext expertCubitContext;

  const ExpertsAppbar({
    super.key,
    required this.title,
    required this.expertCubitContext,
  });

  @override
  Widget build(BuildContext context) {
    final expertsFiltersCubit = context.read<ExpertsFiltersCubit>();
    return BlocBuilder<ExpertsFiltersCubit, ExpertsFiltersState>(
      builder: (context, state) {
        return CustomSliverAppbar(
          leading: Row(
            children: [
              IconButton(
                padding: EdgeInsets.only(left: 8.w),
                onPressed: () {
                  context.pop();
                  expertsFiltersCubit.clearFilters();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
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
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    showDragHandle: true,
                    useSafeArea: true,
                    builder: (c) => ExpertsFiltersSheet(
                      onApplyFilters: () {
                        expertCubitContext.read<ExpertCubit>().getExperts(
                              newExpertsFilters: expertsFiltersCubit.currentExpertsFilters,
                            );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
          sliverBottom: CurrentExpertsFilters(
            expertCubitContext: expertCubitContext,
          ),
          expandedHeight:
              expertsFiltersCubit.isFiltersApplied && expertsFiltersCubit.isFiltersShowInAppbar ? 135.h : 60.h,
        );
      },
    );
  }
}
