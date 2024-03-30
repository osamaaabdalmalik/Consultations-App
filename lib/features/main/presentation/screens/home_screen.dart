import 'package:consultations_app/features/main/presentation/widgets/experts_list_view.dart';
import 'package:consultations_app/features/main/presentation/widgets/header_section.dart';
import 'package:consultations_app/features/main/presentation/widgets/home_appbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/specialists_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        HomeAppbar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              HeaderSection(
                title: "Specialists",
                hasSeeAll: false,
              ),
              SpecialistsListView(),
              HeaderSection(
                title: "Top Experts",
              ),
              ExpertsListView(),
              HeaderSection(
                title: "Recommended Experts",
              ),
              ExpertsListView(),
            ],
          ),
        ),
      ],
    );
  }
}
