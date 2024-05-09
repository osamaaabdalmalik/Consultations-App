import 'package:consultations_app/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:consultations_app/features/main/presentation/screens/appointment_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/history_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/home_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/profile_screen.dart';
import 'package:consultations_app/features/main/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> tabs = [
    const HomeScreen(),
    const AppointmentScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: tabs[context.read<MainCubit>().currentTab],
          bottomNavigationBar: BottomNavbar(
            currentTab: context.read<MainCubit>().currentTab,
            changeCurrentTab: context.read<MainCubit>().changeCurrentTab,
          ),
        );
      },
    );
  }
}
