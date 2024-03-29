import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Auth Screen",
        style: TextStyle(
          fontSize: 40,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
