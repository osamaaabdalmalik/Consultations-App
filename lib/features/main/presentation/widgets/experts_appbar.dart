import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/services/status_handler_service.dart';
import 'package:consultations_app/core/widgets/custom_sliver_appbar.dart';
import 'package:consultations_app/features/main/presentation/cubits/expert_cubit/expert_cubit.dart';
import 'package:consultations_app/features/main/presentation/cubits/experts_filters_cubit/experts_filters_cubit.dart';
import 'package:consultations_app/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:consultations_app/features/main/presentation/widgets/current_experts_filters.dart';
import 'package:consultations_app/features/main/presentation/widgets/custom_icon_button.dart';
import 'package:consultations_app/features/main/presentation/widgets/experts_filters_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExpertsAppbar extends StatelessWidget {
  final String title;
  final bool isSearchMode;
  final BuildContext expertCubitContext;

  const ExpertsAppbar({
    super.key,
    required this.title,
    required this.expertCubitContext,
    required this.isSearchMode,
  });

  @override
  Widget build(BuildContext context) {
    final expertsFiltersCubit = context.read<ExpertsFiltersCubit>();
    return BlocBuilder<ExpertsFiltersCubit, ExpertsFiltersState>(
      builder: (context, state) {
        return CustomSliverAppbar(
          leading: isSearchMode
              ? SizedBox(
                  width: 348.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(top: 10.h),
                    child: TextFormField(
                      controller: context.read<MainCubit>().searchTextController,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      cursorColor: AppColors.black,
                      cursorWidth: 0.8,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Search about experts',
                        suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(15.r),
                          onTap: () {
                            if (context.read<MainCubit>().searchTextController.text.isEmpty) {
                              StatusHandlerService.showToast(
                                message: 'please type anything and click again',
                                toastPosition: EasyLoadingToastPosition.center,
                              );
                            }
                          },
                          child: const Icon(
                            Icons.search,
                            color: AppColors.gray,
                          ),
                        ),
                        prefixIcon: IconButton(
                          padding: EdgeInsets.only(left: 8.w),
                          onPressed: () {
                            context.pop();
                            expertsFiltersCubit.clearFilters();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.gray,
                            size: 20,
                          ),
                        ),
                        fillColor: AppColors.primary.withOpacity(0.1),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        if (context.read<MainCubit>().searchTextController.text.isEmpty) {
                          StatusHandlerService.showToast(
                            message: 'please type anything and click again',
                            toastPosition: EasyLoadingToastPosition.center,
                          );
                        }
                      },
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                  ),
                )
              : Row(
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
            if (!isSearchMode)
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
              expertsFiltersCubit.isFiltersApplied && expertsFiltersCubit.isFiltersShowInAppbar ? 135.h : 70.h,
        );
      },
    );
  }
}
