import 'package:flutter/material.dart';

class AppointmentTab extends StatelessWidget {
  const AppointmentTab({super.key});

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
