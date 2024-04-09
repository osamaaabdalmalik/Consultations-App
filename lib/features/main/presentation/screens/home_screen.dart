import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/features/main/presentation/widgets/header_section.dart';
import 'package:consultations_app/features/main/presentation/widgets/home_appbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/recommended_experts_list.dart';
import 'package:consultations_app/features/main/presentation/widgets/specialists_list.dart';
import 'package:consultations_app/features/main/presentation/widgets/top_experts_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeAppbar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              const HeaderSection(
                title: "Specialists",
                hasSeeAll: false,
              ),
              const SpecialistsList(),
              HeaderSection(
                title: "Top Experts",
                onSeeAllTap: () {
                  context.push(AppRoutes.categoryExpertsScreen);
                },
              ),
              const TopExpertsList(),
              HeaderSection(
                title: "Recommended Experts",
                onSeeAllTap: () {
                  context.push(AppRoutes.categoryExpertsScreen);
                },
              ),
              const RecommendedExpertsList(),
            ],
          ),
        ),
      ],
    );
  }
}
