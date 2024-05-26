import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/core/widgets/primary_button.dart';
import 'package:consultations_app/features/main/presentation/cubits/experts_filters_cubit/experts_filters_cubit.dart';
import 'package:consultations_app/features/main/presentation/widgets/sub_category_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExpertsFiltersSheet extends StatelessWidget {
  final void Function() onApplyFilters;

  const ExpertsFiltersSheet({
    super.key,
    required this.onApplyFilters,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpertsFiltersCubit, ExpertsFiltersState>(
      builder: (context, state) {
        final expertsFiltersCubit = context.read<ExpertsFiltersCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Experts Filters",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              if (expertsFiltersCubit.initialExpertsFilters.selectedMainCategory == null) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Main Category:",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: expertsFiltersCubit.mainCategories.length + 1,
                    itemBuilder: (BuildContext context, int index) => SubCategoryChip(
                      label: index == 0 ? 'All' : expertsFiltersCubit.mainCategories[index - 1].name,
                      isSelected: index == expertsFiltersCubit.selectedIndexMainCategory,
                      onSelected: (isSelected) {
                        expertsFiltersCubit.onChangeIndexMainCategory(
                          index: index,
                          mainCategory: index == 0 ? null : expertsFiltersCubit.mainCategories[index - 1],
                        );
                      },
                    ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(
                      width: 5.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
              if (expertsFiltersCubit.newExpertsFilters.selectedMainCategory != null) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Sub Category:",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: expertsFiltersCubit.newExpertsFilters.selectedMainCategory!.subCategories.length + 1,
                    itemBuilder: (BuildContext context, int index) => SubCategoryChip(
                      label: index == 0
                          ? 'All'
                          : expertsFiltersCubit.newExpertsFilters.selectedMainCategory!.subCategories[index - 1].name,
                      isSelected: index == expertsFiltersCubit.selectedIndexSubCategory,
                      onSelected: (isSelected) {
                        expertsFiltersCubit.onChangeIndexSubCategory(
                          index: index,
                          subCategory: index == 0
                              ? null
                              : expertsFiltersCubit.newExpertsFilters.selectedMainCategory!.subCategories[index - 1],
                        );
                      },
                    ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(
                      width: 5.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
              if (expertsFiltersCubit.initialExpertsFilters.selectedExpertsType == ExpertsTypes.allExperts) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Experts Types:",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: ExpertsTypes.values.length,
                    itemBuilder: (BuildContext context, int index) => SubCategoryChip(
                      label: ExpertsTypes.values[index].label,
                      isSelected: index == expertsFiltersCubit.selectedIndexExpertType,
                      onSelected: (isSelected) {
                        expertsFiltersCubit.onChangeIndexExpertType(
                          index: index,
                          expertsTypes: ExpertsTypes.values[index],
                        );
                      },
                    ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(
                      width: 5.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
              SizedBox(
                height: 30.h,
              ),
              PrimaryButton(
                text: 'Apply Filters',
                onPressed: expertsFiltersCubit.isFiltersChanged
                    ? () {
                        context.pop();
                        expertsFiltersCubit.onFiltersApplied();
                        onApplyFilters.call();
                      }
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
