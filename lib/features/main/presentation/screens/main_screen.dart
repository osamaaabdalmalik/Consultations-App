import 'package:consultations_app/features/main/presentation/widgets/bottom_navbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/experts_list_view.dart';
import 'package:consultations_app/features/main/presentation/widgets/header_section.dart';
import 'package:consultations_app/features/main/presentation/widgets/home_appbar.dart';
import 'package:consultations_app/features/main/presentation/widgets/specialists_list_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
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
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
