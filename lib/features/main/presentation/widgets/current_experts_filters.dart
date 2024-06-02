import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/core/widgets/primary_text_button.dart';
import 'package:consultations_app/features/main/presentation/cubits/expert_cubit/expert_cubit.dart';
import 'package:consultations_app/features/main/presentation/cubits/experts_filters_cubit/experts_filters_cubit.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_filter_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentExpertsFilters extends StatelessWidget {
  final BuildContext expertCubitContext;

  const CurrentExpertsFilters({super.key, required this.expertCubitContext});

  @override
  Widget build(BuildContext context) {
    final expertsFiltersCubit = context.read<ExpertsFiltersCubit>();
    return SafeArea(
      bottom: true,
      child: SizedBox(
        height: 75.h,
        child: expertsFiltersCubit.isFiltersApplied && expertsFiltersCubit.isFiltersShowInAppbar
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Filters:',
                          style: TextStyle(color: AppColors.primary),
                        ),
                        PrimaryTextButton(
                          label: 'clear',
                          onPressed: () {
                            expertsFiltersCubit.clearFilters(useInitFilters: true);
                            expertCubitContext.read<ExpertCubit>().getExperts(
                                  newExpertsFilters: expertsFiltersCubit.currentExpertsFilters,
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 35.h,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      children: [
                        if (expertsFiltersCubit.initialExpertsFilters.selectedExpertsType == ExpertsTypes.allExperts &&
                            expertsFiltersCubit.currentExpertsFilters.selectedExpertsType != ExpertsTypes.allExperts)
                          CustomFilterChip(
                            label: expertsFiltersCubit.currentExpertsFilters.selectedExpertsType.label,
                            onDeleted: () {
                              expertsFiltersCubit.onChangeIndexExpertType(
                                index: 0,
                                expertsTypes: ExpertsTypes.allExperts,
                              );
                              expertCubitContext.read<ExpertCubit>().getExperts(
                                    newExpertsFilters: expertsFiltersCubit.currentExpertsFilters,
                                  );
                            },
                          ),
                        SizedBox(
                          width: 5.w,
                        ),
                        if (expertsFiltersCubit.initialExpertsFilters.selectedMainCategory == null &&
                            expertsFiltersCubit.currentExpertsFilters.selectedMainCategory != null)
                          CustomFilterChip(
                            label: expertsFiltersCubit.currentExpertsFilters.selectedMainCategory!.name,
                            onDeleted: () {
                              expertsFiltersCubit.isFiltersShowInAppbar = false;
                              expertsFiltersCubit.onChangeIndexMainCategory(
                                index: 0,
                                mainCategory: null,
                              );
                              expertCubitContext.read<ExpertCubit>().getExperts(
                                    newExpertsFilters: expertsFiltersCubit.currentExpertsFilters,
                                  );
                            },
                          ),
                        SizedBox(
                          width: 5.w,
                        ),
                        if (expertsFiltersCubit.currentExpertsFilters.selectedSubCategory != null)
                          CustomFilterChip(
                            label: expertsFiltersCubit.currentExpertsFilters.selectedSubCategory!.name,
                            onDeleted: () {
                              expertsFiltersCubit.onChangeIndexSubCategory(
                                index: 0,
                                subCategory: null,
                              );
                              expertCubitContext.read<ExpertCubit>().getExperts(
                                    newExpertsFilters: expertsFiltersCubit.currentExpertsFilters,
                                  );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
