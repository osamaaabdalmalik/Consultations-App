import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'History Screen',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
