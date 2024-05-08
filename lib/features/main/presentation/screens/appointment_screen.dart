import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Appointment Screen',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
