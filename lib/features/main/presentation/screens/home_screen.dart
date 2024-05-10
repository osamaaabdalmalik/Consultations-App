import 'package:consultations_app/core/constants/app_keys.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/core/widgets/primary_loader.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:consultations_app/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:consultations_app/features/main/presentation/widgets/header_section.dart';
import 'package:consultations_app/features/main/presentation/widgets/home_appbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/recommended_experts_list.dart';
import 'package:consultations_app/features/main/presentation/widgets/specialists_list.dart';
import 'package:consultations_app/features/main/presentation/widgets/top_experts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<MainCubit>().getHomeData();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const HomeAppbar(),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                BlocBuilder<MainCubit, MainState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => Center(
                        child: PrimaryLoader(
                          padding: EdgeInsets.symmetric(vertical: 250.h),
                        ),
                      ),
                      orElse: () => const SizedBox(),
                      loaded: (homeData) => HomeContent(homeData: homeData),
                      changeTabSuccess: (homeData) {
                        if (homeData != null) {
                          return HomeContent(homeData: homeData);
                        }
                        return const Center(
                          child: PrimaryLoader(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final HomeData homeData;

  const HomeContent({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderSection(
          title: "Specialists",
        ),
        SpecialistsList(mainCategories: homeData.mainCategories),
        HeaderSection(
          title: "Top Experts",
          onSeeAllTap: () {
            context.push(
              AppRoutes.expertsScreen,
              extra: {
                AppKeys.expertsType: ExpertsTypes.topExperts,
              },
            );
          },
        ),
        TopExpertsList(
          experts: homeData.highestRatedExperts,
        ),
        HeaderSection(
          title: "Recommended Experts",
          onSeeAllTap: () {
            context.push(
              AppRoutes.expertsScreen,
              extra: {
                AppKeys.expertsType: ExpertsTypes.recommendedExperts,
              },
            );
          },
        ),
        RecommendedExpertsList(experts: homeData.highestRecommendedExperts),
      ],
    );
  }
}
