import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/widgets/primary_loader.dart';
import 'package:consultations_app/features/main/presentation/cubits/expert_cubit/expert_cubit.dart';
import 'package:consultations_app/features/main/presentation/widgets/expert_full_info_card.dart';
import 'package:consultations_app/features/main/presentation/widgets/experts_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpertsScreen extends StatelessWidget {
  final String titleScreen;

  const ExpertsScreen({
    super.key,
    required this.titleScreen,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ExpertCubit>().getExperts();
      },
      child: CustomScrollView(
        controller: context.read<ExpertCubit>().scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          ExpertsAppbar(
            title: titleScreen,
            expertCubitContext: context,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                BlocBuilder<ExpertCubit, ExpertState>(
                  builder: (context, state) {
                    final expertCubit = context.read<ExpertCubit>();
                    return state.maybeWhen(
                      loading: () => Center(
                        child: PrimaryLoader(
                          padding: EdgeInsets.symmetric(vertical: 250.h),
                        ),
                      ),
                      orElse: () => const SizedBox(),
                      loaded: (experts) => experts.isNotEmpty
                          ? ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                experts.length + 1,
                                (index) {
                                  if (index < experts.length) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(
                                        bottom: 10.h,
                                      ),
                                      child: ExpertFullInfoCard(
                                        expert: experts[index],
                                      ),
                                    );
                                  } else {
                                    return expertCubit.loaded
                                        ? const SizedBox()
                                        : Container(
                                            padding: EdgeInsets.symmetric(vertical: 30.h),
                                            child: expertCubit.hasMore
                                                ? PrimaryLoader(
                                                    size: 30.w,
                                                  )
                                                : Center(
                                                    child: Text(
                                                      "No More Any Expert",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: AppColors.primary,
                                                        fontSize: 18.sp,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                          );
                                  }
                                },
                              ),
                            )
                          : Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 250.h),
                                child: Text(
                                  "No  Any Expert",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
