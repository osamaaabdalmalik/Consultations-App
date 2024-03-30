import 'package:consultations_app/features/main/presentation/screens/home_screen.dart';
import 'package:consultations_app/features/main/presentation/widgets/bottom_navbar.dart';
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
      body: HomeScreen(),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
